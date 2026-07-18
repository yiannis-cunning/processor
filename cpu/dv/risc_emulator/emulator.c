

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <unistd.h>


#define ISHEXDIG(x) ( (( (x) >= '0') && ( (x) <= '9')) || (( (x) >= 'a') && ( (x) <= 'f')) || (( (x) >= 'A') && ( (x) <= 'f')) )
#define ISOUTSIDE(x, low, high)  ( ( (x) <  (low) ) || ( (x) >  (high) ) )
#define ISINSIDE(x, low, high)   ( ( (x) >= (low) ) || ( (x) <= (high) ) )

#define MAX_ICCM_DCCM_SIZE_B 0x10000
// Stack should be word aligned ...
#define STACK_START_ADDR    0x100000
#define MAX_STACK_SIZE      0x10000
#define PC_QUIT_ADDR        0x10000


typedef struct mem_segment_t {
    uint8_t * mem;
    uint32_t alloc_size;
    uint32_t addr_base; // Address of First read-write-able byte
    uint32_t addr_end;  // Address of Last read-write-able byte
    mem_segment_t * next;
} mem_segment_t;


//  ****      Static Simulations structures      **** //
typedef struct memory_t {
    mem_segment_t *seg_head;

    uint8_t * main_mem;
    uint32_t mem_size_bytes;
} memory_t;

typedef struct risk_core {
    uint32_t reg[32];
    uint32_t pc;
} risk_core_t;


static memory_t memory = {0};

static risk_core_t cpu = {0};




//  ****      Helper Functions      **** //
void passert(bool cond, char * msg){
    if(~cond){
        printf("ERROR: %s\n", msg);
    }
}

uint32_t get_bits(uint32_t num, uint32_t msb, uint32_t lsb){
    passert( (msb >= lsb) && (msb <= 31), "Bad get_bits call made");

    uint32_t num_bits = (msb - lsb) + 1;
    uint32_t mask = (1 << num_bits) - 1;

    return (num >> lsb) & mask;
}


uint32_t sign_extend(uint32_t num, uint32_t numbits){
    passert( (numbits > 0) & (numbits <= 32), "Bad call to sign extend");

    uint32_t msb = numbits - 1;
    passert( (num >> (msb + 1) ) == 0, "Bad sign extended value");

    uint32_t sign_mask = 0xFFFFFFFF;
    if( (num >> msb) == 0x1){ // Negative value
        sign_mask = 0xffffffff << (msb + 1); 
    } else{
        sign_mask = 0;
    }

    return (int32_t)(num | sign_mask);
}


uint32_t get_bits_signed(uint32_t num, uint32_t msb, uint32_t lsb) {
    uint32_t num_int = get_bits(num, msb, lsb);
    return sign_extend(num_int, msb - lsb + 1 );
}



//  ****      Memory Functions      **** //
mem_segment_t *get_seg(uint32_t addr, uint8_t strb_en)
{	
  // Byte addressable, little endian
    uint32_t rdata;
    uint32_t nbytes, align_mask;
    mem_segment_t *seg = memory.seg_head;
    
    // 1) Find corresponding segment
    while(seg != NULL){
        if( ISINSIDE(addr, seg->addr_base, seg->addr_end) ){
            break;
        }
        seg = seg->next;
    }
    passert(seg != NULL, "Memory access belongs to no mapped segments.");
    passert(strb_en == 0x1 || strb_en == 0x3 || strb_en == 0xF, "Bad byte select value");

    nbytes = ones(strb_en); // 1, 2 or 4
    align_mask = (1 << (nbytes - 1)) - 1;

    // 2) Check alignment
    passert( (addr & align_mask) == 0, "Memory read is out of alignment");
    passert( ISINSIDE(addr + nbytes - 1, seg->addr_base, seg->addr_end), "Badly aligned segment");

    return seg;
}


uint32_t mem_read(uint32_t raddr, uint8_t strb_en, bool load_unsigned){
    // Byte addressable, little endian
    uint32_t rdata;
    uint32_t nbytes = ones(strb_en);
    mem_segment_t *seg = get_seg(raddr, strb_en);

    // 3) Read byte from mem.
    rdata = load_unsigned ? (0) : (0xFFFFFFFF);
    for(uint32_t i = nbytes - 1; i >= 0; i -= 1){   // Little endian
        rdata = (rdata << 8);
        passert( ISINSIDE(raddr + i - seg->addr_base, 0, seg->alloc_size - 1), "Out of bounds access");
        rdata += (uint32_t) seg->mem[raddr + i - seg->addr_base];
    }

    return rdata;
}

void mem_write(uint32_t waddr, uint32_t wdata, uint32_t strb_en){
    // Byte addressable, little endian
    mem_segment_t *seg = get_seg(waddr, strb_en);
    uint32_t nbytes = ones(strb_en);

    // 3) Write bytes to mem
    for(uint32_t i = 0; i < nbytes; i += 1){   // Little endian
        passert( ISINSIDE(waddr + i - seg->addr_base, 0, seg->alloc_size - 1), "Out of bounds access");
        seg->mem[waddr + i - seg->addr_base] = (uint8_t)(wdata & 0xFF);
        wdata = wdata >> 8;
    }

}



void load_from_bin(char * memory_image){
    passert(false, "Not implemented");
    /*
    int fd;
    struct stat st;
    

    // 3) Open file
    fd = open(memory_image, O_RDONLY);
    if(fd == -1){
        printf("Could not open memory file %s\n", memory_image);
        exit(1);
    }


    // 2) Get file size
    if (stat(memory_image, &st) != 0) {
        printf("Error getting file size");
        exit(1);
    }


    memory.mem_size_bytes = st.st_size & (~0x3); // Round down to multiple of 4 bytes
    if((st.st_size & 0x3) != 0){
        memory.mem_size_bytes += 1; // Round up to multiple of 4 bytes
    }

    memory.main_mem = (uint8_t *)calloc(memory.mem_size_bytes, sizeof(uint8_t));

    // 3) Copy in the file.
    int bytes_to_read = st.st_size;
    int bytes_read = 0;
    uint8_t *dest = memory.main_mem;
    while(bytes_to_read != 0){
        bytes_read = read(fd, dest, bytes_to_read);
        bytes_to_read = bytes_to_read - bytes_read;
    }
    */
}



// Convert hex string to unsigned integer. First nchars of buf.
uint32_t atoi_nhex(char * buf, uint32_t nchars){
    uint32_t ans = 0;
    passert(nchars <= 8, "Number is too big for atoi_nhex");

    for(int i = 0; i < nchars; i += 1){
        ans = ans << 4;
        
        uint8_t inc =   ((buf[i] >= '0') && (buf[i] <= '9')) ? (buf[i] - '0') :
                        ((buf[i] >= 'a') && (buf[i] <= 'f')) ? (buf[i] - 'a') :
                        ((buf[i] >= 'A') && (buf[i] <= 'F')) ? (buf[i] - 'A') : (0xFF);
        passert(inc <= 15, "Bad hex value in atoi_nhex conversion");

        ans += inc;
    }

    return ans;

}


typedef enum {
    DATA_RECORD = 0,
    EOF_RECORD = 1
} e_ihex_record_type;

typedef struct ihex_entry_t{
    e_ihex_record_type rec_type;
    uint8_t checksum;
    uint32_t addr;
    uint32_t addr_end;
    uint8_t data[256];
    uint8_t num_bytes;
} ihex_entry_t;



void get_next_record(int fd, ihex_entry_t *record){
    int bytes_read, n;
    char buf[1024];

    // 1) Read in next full line 
    bytes_read = 0;
    n = 0;
    while(1){
        n = read(fd, buf + bytes_read, 1);
        bytes_read += 1;
        passert(n == 1, "Bad read from file");
        if(buf[bytes_read - 1] == '\n'){
            break;
        }
        passert(bytes_read < 550, "Buffer overflow"); // Each line should be maximum 523 bytes
    }

    
    
    // 2) check that line = ':(\w){8}(\w*)(\w){2}\r\n'
    passert( (bytes_read >= 13) && (bytes_read <= 269), "Line is too big or too small");

    passert(buf[0] == ':', "Missing start : in ihex file.");
    uint32_t cc_checksum = 0;
    uint32_t ll_data_len = atoi_nhex(buf + 1, 2);
    uint32_t aaaa_data_addr = atoi_nhex(buf + 3, 4);
    uint32_t tt_rec_type = atoi_nhex(buf + 7, 2);

    passert(bytes_read == (ll_data_len*2 + 13), "Bad line read in load_from_ihex, data length does not match bytes that were read.");

    cc_checksum += ll_data_len + get_bits(aaaa_data_addr, 7, 0) + get_bits(aaaa_data_addr, 15, 8) + tt_rec_type;
    for(int i = 0; i < ll_data_len*2; i += 2){
        cc_checksum += atoi_nhex(buf + 9 + i, 2);
    }
    uint32_t cc_checksum_file = atoi_nhex(buf + 9 + ll_data_len*2, 2);
    passert(cc_checksum == cc_checksum_file, "Bad checksum in ihex file");
    passert(buf[11 + ll_data_len*2] == '\r', "Missing \\r in ihex file line");



    // 3) Fill out stucture
    record->rec_type    = (e_ihex_record_type) tt_rec_type;
    record->addr        = aaaa_data_addr;
    record->checksum    = cc_checksum;
    record->num_bytes   = ll_data_len;
    record->addr_end = record->addr + ll_data_len - 1;
    passert(record->addr_end >= record->addr, "Overflow calculating end address");
    for(int i = 0; i < ll_data_len; i += 1){
        record->data[i] = atoi_nhex(buf + 9 + i*2, 2);
    }


    // 4) More assertions based on type
    switch(record->rec_type){
        case DATA_RECORD: // Data record
            // No conditions ...
            break;
        case EOF_RECORD: // EOF record
            // All other entries should be 0
            passert( (record->num_bytes == 0) && (record->addr == 0), "Bad EOF record in ihex file");
            break;
    }

    return;

}

// Format:
/*
    line = ':(\w){8}(\w*)(\w){2}\r\n'
    file = line*
    Maybe no newline at end of file.

*/
mem_segment_t * load_from_ihex(char *ihex_file){
    int fd = 0;
    ihex_entry_t record = {0};
    bool end_of_file = false;

    fd = open(ihex_file, O_RDONLY);
    assert(fd != -1, "Could not open ihex file");
    printf("INFO: Reading in %s as a ihex file", ihex_file);


    uint32_t max_used_addr = 0x0;
    uint32_t min_used_addr = 0xFFFFFFFF;

    while(~end_of_file)
    {
        get_next_record(fd, &record);
    
        switch(record.rec_type)
        {
            case DATA_RECORD: // Data record
                min_used_addr = (record.addr < min_used_addr) ? (record.addr) : (min_used_addr);
                max_used_addr = (record.addr_end > max_used_addr) ? (record.addr_end) : (max_used_addr);
                break;
            case EOF_RECORD: // EOF record
                end_of_file = true;
                break;
        }
    }

    uint32_t iccm_dccm_size = max_used_addr - min_used_addr + 1;
    passert(iccm_dccm_size <= MAX_ICCM_DCCM_SIZE_B, "ihex is too big for MAX_ICCM_DCCM_SIZE_B");

    // Make block allocation    
    mem_segment_t * iccm_dccm_seg = (mem_segment_t *)calloc(sizeof(mem_segment_t), 1);
    iccm_dccm_seg->alloc_size = iccm_dccm_size;
    iccm_dccm_seg->addr_base = min_used_addr;
    iccm_dccm_seg->addr_end = max_used_addr;
    iccm_dccm_seg->mem = (uint32_t *)calloc(sizeof(uint8_t), iccm_dccm_size);
    iccm_dccm_seg->next = NULL;
    
    
    // Fill in the allocation
    passert( lseek(fd, 0, SEEK_SET) == 0, "Could not seek back to begining of ihex file");
    end_of_file = false;
    
    while(!end_of_file)
    {
        get_next_record(fd, &record);

        if(record.rec_type == DATA_RECORD) {
            // Copy in data to allocation
            memcpy(iccm_dccm_seg->mem + record.addr, record.data, record.num_bytes);
        }
        else if(record.rec_type == EOF_RECORD) {
            end_of_file = true;
        }
        else {
            passert(false, "Bad record type found in ihex file");
        }

    }


    return iccm_dccm_seg;
}


/*
    Initialize mem_segment_t memory
*/
void mem_init(uint32_t sp, uint32_t max_stack_size, char *ihex_file){
    mem_segment_t * iccm_dccm_seg = NULL;
    mem_segment_t * stack_seg = NULL;


    // A) Initialize memory structure
    memory.seg_head = NULL;
    
    // B) Add new segment to load binary 
    iccm_dccm_seg = load_from_ihex(ihex_file);

    // C) Add in stack segment
    stack_seg = (mem_segment_t *)calloc(sizeof(mem_segment_t), 1);
    stack_seg->alloc_size = max_stack_size;
    stack_seg->addr_base = sp - max_stack_size;
    stack_seg->addr_end = sp - 1;
    stack_seg->mem = (uint32_t *)calloc(sizeof(uint8_t), max_stack_size);
    stack_seg->next = NULL;

    // D) Link together
    memory.seg_head = iccm_dccm_seg;
    iccm_dccm_seg->next = stack_seg;

    // E) Checks
    mem_segment_t *segtemp = memory.seg_head;
    mem_segment_t *otherseg = NULL;
    while(segtemp){

        // Check that every segment is aligned.
        passert( ((segtemp->addr_base & 0x3) == 0) && (( (segtemp->addr_end + 1) & 0x3) == 0), "Segment is not aligned");

        // and no segments overlap
        otherseg = memory.seg_head;
        while(otherseg != NULL){
            passert( ISOUTSIDE(otherseg->addr_base, segtemp->addr_base, segtemp->addr_end), "Segments overlap" );
            passert( ISOUTSIDE(otherseg->addr_end,  segtemp->addr_base, segtemp->addr_end), "Segments overlap" );
            otherseg = otherseg->next;
        }

        segtemp = segtemp->next;
    }


    // D) Print address map
    // TODO...

    return;
}





//  ****      Simulator Functions      **** //


void process_cmd(uint32_t instr_r){
    uint32_t rd, immd, rs1_val, rs2_val;
    uint32_t immd_b, immd_i, immd_s, immd_u, immd_j;
    uint32_t opcode = get_bits(instr_r, 6, 0); 

    uint32_t addr_eff, numbytes, strb_en, alu_res;

    // Common feilds
    rd = get_bits(instr_r, 11, 7); 
    rs1_val = cpu.reg[get_bits(instr_r, 19, 15)];
    rs2_val = cpu.reg[get_bits(instr_r, 24, 20)];

    
    immd_b = sign_extend(
                (get_bits(instr_r, 31, 31) << 12) + 
                (get_bits(instr_r, 30, 25) << 5) +
                (get_bits(instr_r, 11, 8) << 1) +
                (get_bits(instr_r, 7, 7) << 11),
                13); // 13b immd, sign extended
    immd_i = sign_extend(
                get_bits(instr_r, 31, 20),
                12);   // 12b immd, sign extended
    immd_s = sign_extend(
                    (get_bits(instr_r, 31, 25) << 5) + 
                    (get_bits(instr_r, 11, 7) << 0),
                12);   // 12b immd, sign extended
    immd_u = get_bits(instr_r, 31, 12) << 12; // No sign extend needed

    immd_j = sign_extend(
                (get_bits(instr_r, 31, 31) << 20) + 
                (get_bits(instr_r, 30, 21) << 1)  + 
                (get_bits(instr_r, 20, 20) << 11) +
                (get_bits(instr_r, 19, 12) << 12),
                21); // 21b immd, sign extended

    
    switch(opcode) {
        case 0b0110111: // LUI - Load Unsigned Immediate
            cpu.reg[rd] = immd_u;
            cpu.pc = cpu.pc + 4;
            break;

        case 0b0010111: // AUIPC - Add Upper Immediate to PC
            cpu.reg[rd] = cpu.pc + immd_u;
            cpu.pc = cpu.pc + 4;
            break; 

        case 0b1101111: // JAL - Jump and Link
            cpu.reg[rd] = cpu.pc + 4;              // Link
            cpu.pc = immd_j + cpu.pc;              // Jump
            break;
            
        case 0b1100111: // JALR - Jump and Link, using Register
            cpu.reg[rd] = cpu.pc + 4;                             // Link
            cpu.pc = (rs1_val + immd_i) & (0xFFFFFFFE);           // Jump
            passert(get_bits(instr_r, 14, 12) == 0, "Bad JALR instruction");
            break; 

        case 0b1100011:
            // B* - Branch
            bool branch_cond = false;

            switch(get_bits(instr_r, 14, 13)){
                case 0b00: // BEQ
                    branch_cond = (rs1_val == rs2_val);
                    break;
                case 0b10: // BLT
                    branch_cond = ( ( (int32_t) (rs1_val) ) < ( (int32_t) (rs2_val) ) );
                    break;
                case 0b11: // BLTU
                    branch_cond = (rs1_val < rs2_val); 
                    break;
                default:
                    passert(false, "Bad Branch instruction");
            }
            if(get_bits(instr_r, 12, 12) ){
                branch_cond = ! branch_cond; // Invert condition
            }

            if(branch_cond){
                cpu.pc = cpu.pc + immd_b;
            } else{
                cpu.pc = cpu.pc + 4;
            }
            break;

        case 0b0000011: // L* - Load
            addr_eff = rs1_val + immd_i;

            bool ld_unsigned = (get_bits(instr_r, 14, 14) == 0x1);
            numbytes = 1 << (get_bits(instr_r, 13, 12));
            strb_en = (1 << numbytes ) - 1;

            passert((get_bits(instr_r, 13, 12) <= 2) && get_bits(instr_r, 14, 12) != 0b110, "Bad Load func3 value");

            cpu.reg[rd] = mem_read(addr_eff, strb_en, ld_unsigned);
            cpu.pc = cpu.pc + 4;
            
            break;
        case 0b0100011: // S - Store
            addr_eff, numbytes, strb_en;
            
            addr_eff = rs1_val + immd_s;
            numbytes = 1 << get_bits(instr_r, 14, 12);
            passert(numbytes <= 2, "Bad Store func3 value");
            strb_en = (1 << numbytes ) - 1;

            mem_write(addr_eff, rs2_val, strb_en);
            cpu.pc = cpu.pc + 4;
            break;
        case 0b0010011: // Arithmetic with immediate
            alu_res = 0;
            uint32_t shamt = get_bits(instr_r, 24, 20);

            switch (get_bits(instr_r, 14, 12))
            {
                case 0b000: // ADDI
                    alu_res = rs1_val + immd_i;
                    break;
                case 0b010: // SLTI
                    alu_res = ( ((int32_t) rs1_val) < ((int32_t) immd_i) ) ? (0b1) : (0b0);
                    break;
                case 0b011: // SLTIU
                    alu_res = ( rs1_val < immd_i ) ? (0b1) : (0b0);
                    break;
                case 0b100: // XORI
                    alu_res = rs1_val ^ immd_i;
                    break;
                case 0b110: // ORI
                    alu_res = rs1_val | immd_i;
                    break;
                case 0b111: // ANDI
                    alu_res = rs1_val & immd_i;
                    break;
                case 0b001: // SLLI
                    alu_res = rs1_val << shamt;
                    passert(get_bits(instr_r, 31, 25) == 0b0, "Bad SLLI instruction");
                    break;
                case 0b101: // SRLI/SRAI
                    if(get_bits(instr_r, 31, 25) == 0b0){
                        alu_res = rs1_val >> shamt;
                    } 
                    else if(get_bits(instr_r, 31, 25) == 0b0100000){
                        alu_res = ((int32_t) rs1_val) >> shamt;
                    } else{
                        passert(false, "Bade SR instruction");
                    }
                    break;
                default:
                    passert(false, "Bade ALU code");
                    break;
            }

            cpu.reg[rd] = alu_res;
            cpu.pc = cpu.pc + 4;
            break;
        case 0b0110011: // Arithmetic with register
            alu_res = 0;
            uint32_t func7 = get_bits(instr_r, 31, 25);
            uint32_t func3 = get_bits(instr_r, 14, 12);

            switch (func3)
            {
                case 0b000: // ADD/SUB
                    if(func7 == 0b0)
                        alu_res = rs1_val + rs2_val;
                    else if(func7 == 0b0100000)
                        alu_res = rs1_val - rs2_val;
                    else
                        passert(false, "Bad ADD/SUB instruction");
                    break;
                case 0b001: // SLL
                    alu_res = rs1_val << (rs2_val & 0x1F);
                    passert(func7 == 0b0, "Bad SLL instruction");
                    break;
                case 0b010: // SLT
                    alu_res = ( ((int32_t) rs1_val) < ((int32_t) rs2_val) ) ? (0b1) : (0b0);
                    passert(func7 == 0b0, "Bad SLT instruction");
                    break;
                case 0b011: // SLTU
                    alu_res = ( rs1_val < rs2_val ) ? (0b1) : (0b0);
                    passert(func7 == 0b0, "Bad SLTU instruction");
                    break;
                case 0b100: // XOR
                    alu_res = rs1_val ^ rs2_val;
                    passert(func7 == 0b0, "Bad XOR instruction");
                    break;
                case 0b101: // SRL/SRA
                    if(func7 == 0b0)
                        alu_res = rs1_val >> (rs2_val & 0x1F);
                    else if(func7 == 0b0100000)
                        alu_res = ((int32_t) rs1_val) >> (rs2_val & 0x1F);
                    else
                        passert(false, "Bade SR instruction");
                    break;
                case 0b110: // OR
                    alu_res = rs1_val | rs2_val;
                    passert(func7 == 0b0, "Bad XOR instruction");
                    break;
                case 0b111: // AND
                    alu_res = rs1_val & rs2_val;
                    passert(func7 == 0b0, "Bad XOR instruction");
                    break;
                default:
                    passert(false, "Bade ALU code");
                    break;
            }

            cpu.reg[rd] = alu_res;
            cpu.pc = cpu.pc + 4;
            break;
        case 0b0001111: // Fence/Memory Ordering
            passert( get_bits(instr_r, 14, 12) == 0b000, "Bad Fence Instruction");
            cpu.pc = cpu.pc + 4;
            break;
        case 0b1110011: // Sys Call instructions
            passert( (get_bits(instr_r, 31, 7) == 0b10000000000000) || get_bits(instr_r, 31, 7) == 0b0, "Bad Sys call instruction" );
            passert(false, "Sys call instruction not implemented");
            break;
        default :
            passert(false, "BAD OPCODE\n");
            break;
    }


}




void simulate(char *memory_image, uint32_t pc_start){
    printf("Running simulation with memory image file %s, and pc start address %u\n", memory_image, pc_start);
    printf("Initializing with stack start addr %d, and size %d\n", STACK_START_ADDR, MAX_STACK_SIZE);
    mem_init(STACK_START_ADDR, MAX_STACK_SIZE, memory_image);


    // CPU core struct = cpu;
    // Memory core struct = memory;

    uint32_t program_end_addr = PC_QUIT_ADDR;
    uint32_t max_cmds = 10000;
    cpu.pc = pc_start;

    uint32_t cmds_done = 0;
    uint32_t instr_r = 0;
    while( (cpu.pc != program_end_addr) && (cmds_done < max_cmds)){
        
        instr_r = mem_read(cpu.pc, 0xf, true); 
        process_cmd(instr_r); 

        cmds_done += 1;
    }

    if(cpu.pc == program_end_addr){
        printf("Program reached target end address of 0x%x\n", program_end_addr );
    } else if(cmds_done == max_cmds){
        printf("Quitting program after reaching maximum commands %d\n", max_cmds);
    }
    
}



int main(int argv, char **argc){
    // ./emulator <memory_image> <PC_start_addr>
    passert(argv == 3, "Usage: ./emulator <memory_image> <PC_start_addr>");
    
    simulate(argc[1], strtoul(argc[2], NULL, 16));

}


// Memory:
// input binary, or ihex, will specify some range of memory
// binary = 0 -> N
// ihex = X -> Y
// Then the stack should be allocated starting at some address Z
// it can grow, downwards to some max stack size W.
// All accesses should be within
// Total allocate

/*
    Required inputs:
        -> PC start addr
        -> Stack start addr (define?)
        -> Max stack size (define?)
        -> Type of input file? (always ihex?)
        -> program end addr? (define?)

*/