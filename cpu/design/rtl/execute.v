module execute(
    input wire resetn_i,
    input wire clk_i,


    // Execute input 
    input wire [9:0]    control_bits_reg_i, // {branch_en_invert, branch_en, immd_en, wb_en, mw_en, mr_en, alu_op[4]}
    input wire [31:0]   rs1_val_reg_i,
    input wire [31:0]   rs2_val_reg_i,
    input wire [31:0]   immd_val_reg_i,
    input wire [4:0]    rd_addr_reg_i,
    input wire [31:0]   pc_p4_reg_i,
    input wire [31:0]   br_dest_reg_i,

    // Memory input
    output reg [2:0]    control_bits_reg_o, // {wb_en, mw_en, mr_en}
    output reg [31:0]   alu_res_reg_o,
    output reg [31:0]   rs2_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg [31:0]   pc_p4_reg_o,

    // Back to PC input
    output wire         branch_enable,
    output wire [31:0]  pc_dest



);

    wire flush_en;
    wire [31:0] alu_res_int;
    wire [31:0] alu_val2 = control_bits_reg_i[7] ? (immd_val_reg_i) : (rs2_val_reg_i);  // Use immediate enable

    alu I_alu(
        .val1(rs1_val_reg_i),
        .val2(alu_val2),

        .operation( {1'b0, control_bits_reg_i[3:0]} ),
        .vout(alu_res_int)
    );

    // Branch logic
    assign branch_enable = (alu_res_int[0] ^ control_bits_reg_i[9]) & control_bits_reg_i[8];  // branch_invert_en, branch_en
    assign pc_dest = br_dest_reg_i;
    assign flush_en = branch_enable;


    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            alu_res_reg_o       <= 'd0;
            rd_addr_reg_o       <= 'd0;
            rs2_val_reg_o       <= 'd0;
            control_bits_reg_o  <= 'd0;
            pc_p4_reg_o         <= 'd0;
        end else begin
            alu_res_reg_o       <= alu_res_int;
            rs2_val_reg_o       <= rs2_val_reg_i;
            control_bits_reg_o  <= (flush_en) ?  ('d0) : (control_bits_reg_i[6:4]);
            rd_addr_reg_o       <= rd_addr_reg_i;
            pc_p4_reg_o         <= pc_p4_reg_i;
        end
    end


endmodule