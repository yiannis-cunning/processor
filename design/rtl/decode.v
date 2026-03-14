

`define PC_INIT 32'h100


module decode(
    input wire resetn_i,
    input wire clk_i,


    // Decode input
    input wire [6:0] opcode_reg_i,
    input wire [31:0] instr_reg_i,
    input wire [31:0] pc_p4_reg_i,


    // Execute input 
    output reg [7:0]    control_bits_reg_o, // {immd_en, wb_en, mw_en, mr_en, alu_op[3:0]}
    output reg [31:0]   rs1_val_reg_o,
    output reg [31:0]   rs2_val_reg_o,
    output reg [31:0]   immd_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg [31:0]   pc_p4_reg_o


);


    wire [31:0] rs1_val;
    wire [31:0] rs2_val;

    // Write port 1
    wire [4:0] waddr1_i;
    wire [31:0] wdata1_i;
    wire wr_en_i;

    


    register_file I_rf(
        .resetn_i(resetn_i),
        .clk_i(clk_i),

        .raddr1_i(instr_reg_i[19:15]),   // Rs1
        .rdata1_i(rs1_val),

        .raddr2_i(instr_reg_i[24:20]),   // Rs2
        .rdata2_i(rs2_val),

        .waddr1_i(waddr1_i),
        .wdata1_i(wdata1_i),
        .wr_en_i(wr_en_i)
    );

    // Write-back en, write-to-mem en, read-from-mem en
    reg [`N_OP_CODES-1:0] [3:0] lut;
    wire [3:0] lut_rd;

    assign lut_rd = lut[opcode_reg_i];

    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            control_bits_reg_o <= 'd0;
            rs1_val_reg_o <= 'd0;
            rs2_val_reg_o <= 'd0;
            rd_addr_reg_o <= 'd0;
            pc_p4_reg_o <= 'd0;
        end else begin
            // {wb_en, mw_en, mr_en, alu_op[3:0]}
            control_bits_reg_o[5:4]  <= lut_rd;
            control_bits_reg_o[3:0]  <= lut_rd;

            rs1_val_reg_o       <= rs1_val;
            rs2_val_reg_o       <= rs2_val;
            rd_addr_reg_o       <= instr_reg_i[11:7];
            pc_p4_reg_o         <= pc_p4_reg_i;
        end
    end


endmodule