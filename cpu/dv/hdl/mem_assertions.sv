module mem_assertions();


    // Memory alignment assertions - Assert all accesses are word-aligned
    /*always @(*) begin
        if(dut.data_rd_en_o) begin
            assert(dut.data_rd_addr_o[1:0] == 0) else $error("Misaligned data read access");
        end
    end*/

endmodule