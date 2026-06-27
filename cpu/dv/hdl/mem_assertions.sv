`include "instruction_assertion.svh"

module mem_assertions();


    // Memory alignment assertions - Assert all accesses are word-aligned
    /*always @(*) begin
        if(dut.data_rd_en_o) begin
            assert(dut.data_rd_addr_o[1:0] == 0) else $error("Misaligned data read access");
        end
    end*/

    wire [31:0] instruction = dut.I_fetch.instr_reg_o[31:0];
    wire resetn = dut.resetn_i;
    wire instr_valid = `COMPARE_ALL_INSTR;
                    
    always @(*) begin
        if(resetn) begin
            assert(instr_valid) else $error("Bad instruction fetched: %h, at time %d ns", instruction, $realtime);
        end
    end

endmodule