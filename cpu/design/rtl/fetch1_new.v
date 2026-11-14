
module fetch2_new(
    input wire      resetn_i,
    input wire      clk_i,

    input wire      stall_en_i,
    input wire      hold_next_i,    // Next pipeline stage does not want to get overwritten
    //output wire     hold_prev_o,    // Ask previous stage to not overwrite self
    //input wire      instr_invalidate_i,

    input wire          branch_enable_i,
    input wire [31:0]   branch_dest_i,

    /* Instruction sigs output */
    output reg [31:0]   f1f2_pcp4_reg_o;
    output reg          f1f2_instr_valid_o


    /* External conections/signals */
    output wire [31:0]      instr_raddr_o,
    output wire             instr_rd_en_o

);
    assign instr_raddr_o = pc;
    assign instr_rd_en_o = ~stall_en_i & ~hold_next_i & ~branch_en; // only 1 cycle high after pc changes.


    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            /* Reset instruction sigs */
            f1f2_pcp4_reg_o     <= 32'd0;
            f1f2_instr_valid_o  <= 32'd0;
            pc                  <= 32'd0;
        end else begin
            if(hold_next_i) begin
                f1f2_pcp4_reg_o     <= f1f2_pcp4_reg_o;
                f1f2_instr_valid_o  <= f1f2_instr_valid_o;
                pc                  <= pc;
            end else if (stall_en_i) begin
                f1f2_pcp4_reg_o     <= 32'd0;
                f1f2_instr_valid_o  <= 1'd0;
                pc                  <= pc;
            end else if(branch_en) begin
                f1f2_pcp4_reg_o     <= 32'd0;
                f1f2_instr_valid_o  <= 1'd0;
                pc                  <= branch_addr;
            end else begin
                f1f2_pcp4_reg_o     <= pc +'d4;
                f1f2_instr_valid_o  <= 1'd1;
                pc                  <= pc + 'd4;
            end
        end
    end



endmodule


/*
    Example execute:
    > branch_en = f(instr_i)
    > send invalidate to all instructions behind it.



*/