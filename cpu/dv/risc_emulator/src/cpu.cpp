


class memory_t {
private:
    uint32_t regs;
public:

    void read();

};

class csr_block_t {
    uint32_t csr_reg;
public:
    access_csr();
}

class cpu_t {


    uint32_t regs;
public:
    memory_t *mem;
    void process_cycle();

};




int main(){

    cpu_t *cpu = new cpu_t();
    memory_t *memory = new memory_t();

    cpu->mem = memory;

    memory->load_from_file(args);
    bool done = false;

    while(!done){
        cpu->process_cycle();
    }

    memory->dump_from_file(args);


}

