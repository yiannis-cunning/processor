class cpu_env extends uvm_env;
    `uvm_component_utils(cpu_env)

    lmb_agent   iccm_lmb_agent;
    mem_model   memory;
    lmb_agent   dccm_lmb_agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);        
        super.build_phase(phase);

        iccm_lmb_agent = lmb_agent::type_id::create("iccm_lmb_agent", this);
        memory = mem_model::type_id::create("mem_model", this);
        memory.load("rom.hex",  `ROM_START_ADDR,  `ROM_SIZE  / 4);
        memory.load("iccm.hex", `ICCM_START_ADDR, `ICCM_SIZE / 4);
        dccm_lmb_agent = lmb_agent::type_id::create("dccm_lmb_agent", this);
        memory.load("dccm.hex",  `DCCM_START_ADDR,  `DCCM_SIZE  / 4);

        uvm_config_db#(mem_model)::set(null, "*", "mem_model_if", memory);

    endfunction

    function void connect_phase(uvm_phase phase);
        iccm_lmb_agent.drv.mem = memory;
        dccm_lmb_agent.drv.mem = memory;
    endfunction
endclass