
`include "risc_mem_cfg.svh"


package main_seq_pkg;

    class main_seq;
        virtual cpu_if cpu_vif;
        virtual sram_dbg_if dccm_dbg_vif;

        function new(virtual cpu_if vif, virtual sram_dbg_if dccm_dbg);
            this.cpu_vif = vif;
            this.dccm_dbg_vif = dccm_dbg;
        endfunction


        task automatic reset_cpu();

            cpu_vif.resetn = 1'b0;
            cpu_vif.run_req_i = 1'b0;
            repeat(3) @(posedge cpu_vif.clk);
            cpu_vif.resetn = 1'b1;
            repeat(2) @(posedge cpu_vif.clk);
            cpu_vif.run_req_i = 1'b1;

        endtask

        task automatic pmem();
            //$display("DCCM addr=0, = %0h", tb_top.I_mem.I_dccm.mem_r[0][31:0] );
            $display("Saving DCCM Memory to file dccm_done.hex");
            $writememh("dccm_done.hex", dccm_dbg_vif.mem_r, 0, `TEST_SIZE_WORDS - 1); // optional range

        endtask


        task automatic run();
            fork
                begin
                    wait(cpu_vif.instr_raddr_o == `PROGRAM_DONE_ADDRESS);
                    $display("PC Reached end loop.");
                    pmem();
                end
                begin
                    #200us;
                    $error("Test timeout after at time %d ns", $realtime);
                end
            join_any

        endtask


    endclass

endpackage