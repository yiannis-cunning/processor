

`include "cpu_defines.vh"

module execute(
    input wire resetn_i,
    input wire clk_i,


    // Execute input 
    input wire [14:0]   control_bits_reg_i, // {branch_dest_for_alu_out, mem_load_unsigned, mem_strb_en[1:0], swap_baddr_alures, branch_en_invert, branch_en, immd_en, wb_en, mw_en, mr_en, alu_op[4]}
    input wire [31:0]   rs1_val_reg_i,
    input wire [31:0]   rs2_val_reg_i,
    input wire [31:0]   immd_val_reg_i,
    input wire [4:0]    rd_addr_reg_i,
    input wire [31:0]   pc_p4_reg_i,
    input wire [31:0]   br_dest_reg_i,

    // Memory input
    output reg [14:0]    control_bits_reg_o, // {mem_load_unsigned, mem_strb_en[1:0], wb_en, mw_en, mr_en}
    output reg [31:0]   alu_res_reg_o,
    output reg [31:0]   rs2_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg [31:0]   pc_p4_reg_o,

    // Back to PC input
    output wire         branch_enable,
    output wire [31:0]  branch_dest



);

    wire flush_en;
    wire [31:0] alu_res_int;
    wire [31:0] alu_res_nxt;
    wire [31:0] alu_val2 = control_bits_reg_i[`IMMD_FOR_ALU2_BITS] ? (immd_val_reg_i) : (rs2_val_reg_i);  // Use immediate enable

    alu I_alu(
        .val1(rs1_val_reg_i),
        .val2(alu_val2),

        .operation( {1'b0, control_bits_reg_i[`ALU_CMD_BITS]} ),
        .vout(alu_res_int)
    );

    // Branch logic
    assign branch_enable    = ( (alu_res_int[0] ^ control_bits_reg_i[`BRANCH_CHK_INV_EN_BITS]) & control_bits_reg_i[`BRANCH_CHK_EN_BITS] ) || control_bits_reg_i[`BRANCH_ADDR_SEL_BITS];  // branch_invert_en, branch_en, jal signal
    assign branch_dest      = control_bits_reg_i[`BRANCH_ADDR_SEL_BITS]  ? (alu_res_int) : (br_dest_reg_i);
    assign flush_en         = 1'b0; //branch_enable;
    
    // For branch + link commands
    assign alu_res_nxt[31:0] = control_bits_reg_i[`STORE_BRANCH_ADDR] ? (br_dest_reg_i) : ( control_bits_reg_i[`BRANCH_ADDR_SEL_BITS] ? (pc_p4_reg_i) : (alu_res_int[31:0]) );


    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            alu_res_reg_o       <= 'd0;
            rd_addr_reg_o       <= 'd0;
            rs2_val_reg_o       <= 'd0;
            control_bits_reg_o  <= 'd0;
            pc_p4_reg_o         <= 'd0;
        end else begin
            alu_res_reg_o       <= alu_res_nxt;
            rs2_val_reg_o       <= rs2_val_reg_i;
            control_bits_reg_o  <= (flush_en) ?  ('d0) : (control_bits_reg_i[`NUM_CONTROL_BITS - 1:0]); // Should not flush here ??? JAL
            rd_addr_reg_o       <= rd_addr_reg_i;
            pc_p4_reg_o         <= pc_p4_reg_i;
        end
    end


endmodule