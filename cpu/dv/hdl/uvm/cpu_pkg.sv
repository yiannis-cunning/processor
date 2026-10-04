


package cpu_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "risc_mem_cfg.svh"

    `include "mem_model.sv"
    `include "lmb_driver.sv"
    `include "lmb_monitor.sv"
    `include "lmb_agent.sv"

    `include "cpu_env.sv"
    `include "topseq.sv"
    `include "simple_test.sv"
    
endpackage