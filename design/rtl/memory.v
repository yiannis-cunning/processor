module memory(
    input wire resetn_i,
    input wire clk_i,


    // Data memory interface
    output wire [31:0]  rd_addr_o,
    input wire [31:0]   rd_data_i,
    output wire         rd_en_o,
    output wire [31:0]  wr_addr_o,
    output wire [31:0]  wr_data_o,
    output wire         wr_en_o,

    // Memory input 
    input wire [2:0]    control_bits_reg_i, // {wb_en, mw_en, mr_en}
    input wire [31:0]   alu_res_reg_i,
    input wire [31:0]   rs2_val_reg_i,
    input wire [4:0]    rd_addr_reg_i,
    input wire [31:0]   pc_p4_reg_i,

    // Write back input
    output reg [31:0]   rd_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg          wb_en_reg_o,
    output reg [31:0]   pc_p4_reg_o

);


    assign rd_addr_o = alu_res_reg_i;   // Address is computed in ALU
    assign wr_addr_o = alu_res_reg_i;
    assign wr_data_o = rs2_val_reg_i;   // Stored value is always rs2
    assign rd_en_o = control_bits_reg_i[0];
    assign wr_en_o = control_bits_reg_i[1];



    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            rd_val_reg_o <= 'd0;
            rd_addr_reg_o <= 'd0;
            wb_en_reg_o <= 'd0;
            pc_p4_reg_o <= 'd0;
        end else begin
            rd_val_reg_o    <= control_bits_reg_i[0] ? (rd_data_i) : (alu_res_reg_i);
            rd_addr_reg_o   <= rd_addr_reg_i;
            wb_en_reg_o     <= control_bits_reg_i[2];
            pc_p4_reg_o     <= pc_p4_reg_i;
        end
    end


endmodule