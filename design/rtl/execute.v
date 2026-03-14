module execute(
    input wire resetn_i,
    input wire clk_i,


    // Execute input 
    input wire [7:0]    control_bits_reg_i, // {immd_en, wb_en, mw_en, mr_en, alu_op[4]}
    input wire [31:0]   rs1_val_reg_i,
    input wire [31:0]   rs2_val_reg_i,
    input wire [31:0]   immd_val_reg_i,
    input wire [4:0]    rd_addr_reg_i,
    input wire [31:0]   pc_p4_reg_i,


    output reg [2:0]    control_bits_reg_o, // {wb_en, mw_en, mr_en}
    output reg [31:0]   alu_res_reg_o,
    output reg [31:0]   rs2_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg [31:0]   pc_p4_reg_o

);


    wire [31:0] alu_res_int;
    wire [31:0] alu_val2 = immd_en ? (immd_val_reg_i) : (rs2_val_reg_i);

    alu I_alu(
        .val1(rs1_val_reg_i),
        .val2(alu_val2),

        .operation(control_bits_reg_i[3:0]),
        .vout(alu_res_int)
    );



    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            alu_res_reg_o <= 'd0;
            rd_addr_reg_o <= 'd0;
            rs2_val_reg_o < = 'd0;
            control_bits_reg_o <= 'd0;
            pc_p4_reg_o <= 'd0;
        end else begin
            alu_res_reg_o       <= alu_res_int;
            rs2_val_reg_o       <= rs2_val_reg_i;
            control_bits_reg_o  <= control_bits_reg_i[6:4];
            rd_addr_reg_o       <= rd_addr_reg_i;
            pc_p4_reg_o         <= pc_p4_reg_i;
        end
    end


endmodule