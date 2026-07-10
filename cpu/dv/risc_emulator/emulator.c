

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <unistd.h>


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
void check_access(uint32_t addr, bool iswrite){	
    passert(addr < memory.mem_size_bytes, "Memory access is out of range");	
}


uint32_t mem_read(uint32_t raddr, uint8_t ldb_en, bool load_unsigned){
    // Byte addressable, little endian
    uint32_t rdata = 0;


    passert(raddr < memory.mem_size_bytes, "Memory access is out of range");

    switch(ldb_en){
        case 1:
            rdata = memory.main_mem[raddr];

            if((~load_unsigned) && ((rdata & 0x80) != 0 ) ){
                rdata += 0xFFFFFF00;
            }

            break;
        case 3:
            passert((raddr & 0x1) == 0, "Memory half-word read is out of alignment");
            rdata = ((uint32_t) memory.main_mem[raddr + 1]) << 8;
            rdata += (uint32_t) memory.main_mem[raddr];

            if((~load_unsigned) && ((rdata & 0x8000) != 0 ) ){
                rdata += 0xFFFF0000;
            }

            break;
        case 0xf:
            passert((raddr & 0x3) == 0, "Memory full-word read is out of alignment");
            rdata = ((uint32_t) memory.main_mem[raddr + 3]) << 24;
            rdata += ((uint32_t) memory.main_mem[raddr + 2]) << 16;
            rdata += ((uint32_t) memory.main_mem[raddr + 1]) << 8;
            rdata += (uint32_t) memory.main_mem[raddr];
            break;
        default:
            passert(false, "Bad value for ldb_en");
            break;
    }

    return rdata;
}

void mem_write(uint32_t waddr, uint32_t wdata, uint32_t strb_en){

    check_access(waddr, true);
    switch(strb_en) {
        case 0x1:
	        memory.main_mem[waddr] = get_bits(wdata, 7, 0); 
            break;
        case 0x3:
	        memory.main_mem[waddr + 0] = (uint8_t) get_bits(wdata, 7, 0); 
	        memory.main_mem[waddr + 1] = (uint8_t) get_bits(wdata, 15, 8); 
            break;
        case 0xf:
	        memory.main_mem[waddr + 0] = (uint8_t) get_bits(wdata, 7, 0); 
	        memory.main_mem[waddr + 1] = (uint8_t) get_bits(wdata, 15, 8); 
	        memory.main_mem[waddr + 2] = (uint8_t) get_bits(wdata, 23, 16); 
	        memory.main_mem[waddr + 3] = (uint8_t) get_bits(wdata, 31, 24); 
            break;
        defualt:
            passert(false, "Bad value for strb_en");
            break;
    }
}



void mem_init(char * memory_image){
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

}

void load_from_bin(){

}

void load_from_ihex(char *ihex_file){
    int fd = 0;

    fd = open()
}



void mem_init_real(uint32_t sp, uint32_t max_stack_size){
    // A) Initialize memory structure
    memory.seg_head = NULL;
    
    // B) Add new segment to load binary 
    memory.seg_head = (mem_segment_t *)calloc(sizeof(mem_segment_t), 1);
    memory.seg_head->alloc_size;
    memory.seg_head->next = NULL;

    // C) Add in stack segment
    mem_segment_t * stack_seg = (mem_segment_t *)calloc(sizeof(mem_segment_t), 1);
    stack_seg->alloc_size = max_stack_size;
    stack_seg->addr_base = sp - max_stack_size;
    stack_seg->addr_end = sp - 1;
    stack_seg->mem = (uint32_t *)calloc(sizeof(uint8_t), max_stack_size);
    stack_seg->next = NULL;

    memory.seg_head->next = stack_seg;
    
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
    mem_init(memory_image);


    // CPU core struct = cpu;
    // Memory core struct = memory;

    uint32_t program_end_addr = 0x0;
    uint32_t max_cmds = 10000;
    cpu.pc = pc_start;

    uint32_t cmds_done = 0;
    uint32_t instr_r = 0;
    while( (cpu.pc != program_end_addr) && (cmds_done < max_cmds)){
        
        instr_r = mem_read(cpu.pc, 0xf, true); 
        process_cmd(instr_r); 

        cmds_done += 1;
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