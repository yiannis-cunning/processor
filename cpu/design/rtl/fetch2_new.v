


module fetch2_new(
    input wire      resetn_i,
    input wire      clk_i,

    input wire      stall_en_i,
    input wire      hold_next_i,    // Next pipeline stage does not want to get overwritten
    output wire     hold_prev_o,    // Ask previous stage to not overwrite self
    input wire      instr_invalidate_i,

    /* Registred input */
    output reg [31:0]   f1f2_pcp4_i,
    input wire          f1f2_instr_valid_i,

    /* Registered output */
    output reg [31:0]   f2d_instr_reg_o,
    output reg [31:0]   f2d_pcp4_reg_o,
    output reg          f2d_instr_valid_reg_o,

    /* External conections/signals */
    output wire [31:0]  instr_rdata_i,
    input wire          instr_rd_wait_i,
    input wire          instr_rd_ready_i,


    output wire         f2_mem_wait_o,

);

    /* Fetch 2 logic */
    wire instr_valid_nxt = f1f2_instr_valid_i;
    assign f2_mem_wait_o = (instr_rd_wait_i & ~instr_rd_ready_i);     // Goes to self.stall_i



    assign hold_prev_o = (instr_valid_nxt & ~instr_invalidate_i) & (hold_next_i | stall_en_i);  // STANDARD CODE

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            f2d_instr_reg_o         <= 32'd0;
            f2d_pcp4_reg_o          <= 32'd0;
            f2d_instr_valid_reg_o   <= 1'd0;
        end else begin
            if(hold_next_i) begin
                // Do nothing
            end else if (stall_en_i) begin
                // Ouput a NOP.
                f2d_instr_reg_o         <= `INSTR_NOP;
                f2d_pcp4_reg_o          <= 32'd0;

                f2d_instr_valid_reg_o   <= 1'd0;
            end else begin
                f2d_instr_reg_o         <= (instr_valid_nxt & ~instr_invalidate_i) ? (instr_rdata_i) : (`INST_NOP);
                f2d_pcp4_reg_o          <= f1f2_pcp4_i;
                
                f2d_instr_valid_reg_o <= instr_valid_nxt & ~instr_invalidate_i; // STANDARD CODE
            end
        end
    end



endmodule
