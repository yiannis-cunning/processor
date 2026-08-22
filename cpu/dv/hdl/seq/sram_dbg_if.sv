`include "risc_mem_cfg.svh"

interface sram_dbg_if;
    logic [31:0] mem_r  [(`DCCM_SIZE >> 2) - 1 :0];

    function automatic logic [31:0] peek(input int addr);
        //return mem_r[addr];
    endfunction

endinterface