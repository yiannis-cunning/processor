

`include "cpu_defines.vh"

module memory(
    input wire resetn_i,
    input wire clk_i,


    // Data memory interface
    output wire [31:0]  rd_addr_o,
    input wire  [31:0]  rd_data_i,
    output wire         rd_en_o,
    output wire [31:0]  wr_addr_o,
    output wire [31:0]  wr_data_o,
    output reg  [3:0]   mem_strb_en_o,
    output wire         wr_en_o,

    // Memory input 
    input wire [14:0]    control_bits_reg_i, // {mem_load_unsigned, mem_strb_en[1:0], wb_en, mw_en, mr_en}
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
    assign rd_en_o = control_bits_reg_i[`MEM_READ_EN_BITS];
    assign wr_en_o = control_bits_reg_i[`MEM_WRITE_EN_BITS];


    reg [31:0] rd_data_int;
    always @(*) begin
        case(control_bits_reg_i[`MEM_STRB_EN_BITS_BITS])
            2'd0 : mem_strb_en_o = 4'b0001;
            2'd1 : mem_strb_en_o = 4'b0011;
            2'd2 : mem_strb_en_o = 4'b1111;
            default : mem_strb_en_o = 4'b1111;
        endcase
        
        case(control_bits_reg_i[`MEM_STRB_EN_BITS_BITS])
            2'd0 : rd_data_int = control_bits_reg_i[`MEM_NO_SIGN_EXTEND_BITS] ? ( {24'd0, rd_data_i[7:0]} ) : ( { {24{rd_data_i[7]}},  rd_data_i[7:0]} );
            2'd1 : rd_data_int = control_bits_reg_i[`MEM_NO_SIGN_EXTEND_BITS] ? ( {16'd0, rd_data_i[7:0]} ) : ( { {16{rd_data_i[15]}}, rd_data_i[15:0]} );
            2'd2 : rd_data_int = rd_data_i;
            default : rd_data_int = rd_data_i;
        endcase
    end

    

    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            rd_val_reg_o <= 'd0;
            rd_addr_reg_o <= 'd0;
            wb_en_reg_o <= 'd0;
            pc_p4_reg_o <= 'd0;
        end else begin
            rd_val_reg_o    <= control_bits_reg_i[`MEM_READ_EN_BITS] ? (rd_data_int) : (alu_res_reg_i);
            rd_addr_reg_o   <= rd_addr_reg_i;
            wb_en_reg_o     <= control_bits_reg_i[`WRITE_BACK_EN_BITS];
            pc_p4_reg_o     <= pc_p4_reg_i;
        end
    end


endmodule