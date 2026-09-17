
`include "fpga_mem_map.svh"


package fpga_seq_pkg;

    class fpga_seq;
        virtual fpga_if vif;

        function new(virtual fpga_if vifi);
            this.vif = vifi;
        endfunction


        task automatic reset_cpu();
            vif.switches = 2'b0;

            vif.resetn = 1'b0;
            vif.run_req = 1'b0;
            repeat(3) @(posedge vif.clk);
            vif.resetn = 1'b1;
            repeat(2) @(posedge vif.clk);
            vif.run_req = 1'b1;

        endtask

        task automatic pmem();
            //$display("DCCM addr=0, = %0h", tb_top.I_mem.I_dccm.mem_r[0][31:0] );
            $display("Saving DCCM Memory to file dccm_done.hex");
            $writememh("dccm_done.hex", vif.dccm_mem_r, 0, `TEST_SIZE_WORDS - 1); // optional range

        endtask

        task automatic toggle_switches();
            fork
                vif.switches = 2'b0;
                forever begin
                    repeat(50) @(posedge vif.clk);
                    vif.switches = vif.switches + 1;
                end

            join_none // start sub-process
        endtask 


        task automatic run();
            reset_cpu();
            
            toggle_switches();

            fork
                begin
                    wait(vif.instr_raddr == `PROGRAM_DONE_ADDRESS);
                    $display("PC Reached end loop.");
                    pmem();
                end
                begin
                    #20us;
                    $error("Test timeout after at time %d ns", $realtime);
                end
            join_any

        endtask


    endclass

endpackage