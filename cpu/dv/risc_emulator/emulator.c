

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/stat.h>


typedef struct memory_t {
    uint8_t * main_mem;
    uint32_t mem_size_bytes;
} memory_t;


static memory_t memory = {0};


void passert(bool cond, char * msg){
    if(~cond){
        printf("ERROR: %s\n", msg);
    }
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
        case 2:
            passert((raddr & 0x1) == 0, "Memory half-word read is out of alignment");
            rdata = ((uint32_t) memory.main_mem[raddr + 1]) << 8;
            rdata += (uint32_t) memory.main_mem[raddr];

            if((~load_unsigned) && ((rdata & 0x8000) != 0 ) ){
                rdata += 0xFFFF0000;
            }

            break;
        case 4:
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

void mem_write(uint32_t waddr, uint32_t strb_en){

}

void mem_init(char * memory_image){
    int fd;
    struct stat st;
    

    // 3) Open file
    fd = open(memory_image, O_RDONLY);
    if(fd == -1){
        print("Could not open memory file %s\n", memory_image);
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

    memory.main_mem = (uint8_t *)calloc(memory.mem_size_bytes);

    // 3) Copy in the file.
    int bytes_to_read = st.st_size;
    int bytes_read = 0;
    uint8_t *dest = memory.main_mem;
    while(bytes_to_read != 0){
        bytes_read = read(fd, dest, bytes_to_read);
        bytes_to_read = bytes_to_read - bytes_read;
    }

}



void simulate(uint32_t pc_start){

}



int main(int argv, char **argc){
    // ./emulator <memory_image> <PC_start_addr>


}