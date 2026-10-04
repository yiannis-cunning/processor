

`include "cpu_defines.vh"

module memory(
    input wire resetn_i,
    input wire clk_i,


    // Data memory interface
    output wire [31:0]  mem_addr_o,
    input wire [31:0]   mem_rdata_i,
    output wire [31:0]  mem_wdata_o,
    output reg [3:0]    mem_strb_en_o,
    output wire         mem_rd_en_o,
    output wire         mem_wr_en_o,
    input wire          mem_ready_i,
    input wire          mem_wait_i,
    
    output wire         mem1_stall_en,

    // Memory 1 output
    output wire [4:0]   mem1_rd_addr_reg_o,
    output wire [14:0]  mem1_control_bits_reg_o,

    // Memory input 
    input wire [14:0]   control_bits_reg_i, // {mem_load_unsigned, mem_strb_en[1:0], wb_en, mw_en, mr_en}
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


    wire mem2_flush_en = (~mem_ready_i & mem_wait_i);
    assign mem1_stall_en = mem2_flush_en;

    assign mem_addr_o = alu_res_reg_i;
    assign mem_wdata_o = rs2_val_reg_i;
    assign mem_rd_en_o = control_bits_reg_i[`MEM_READ_EN_BITS] & ~mem2_flush_en;
    assign mem_wr_en_o = control_bits_reg_i[`MEM_WRITE_EN_BITS] & ~mem2_flush_en;



    // Memory #2
    reg [31:0]      mem1_alu_result_reg;
    reg [4:0]       mem1_rd_addr_reg;
    reg [14:0]      mem1_control_bits_reg;
    reg [31:0]      mem1_pc_reg;




    always @(*) begin
        case(control_bits_reg_i[`MEM_STRB_EN_BITS_BITS])
            2'd0 : mem_strb_en_o = 4'b0001;
            2'd1 : mem_strb_en_o = 4'b0011;
            2'd2 : mem_strb_en_o = 4'b1111;
            default : mem_strb_en_o = 4'b1111;
        endcase
    end


    // Memory 1 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            mem1_alu_result_reg     <= 'd0;
            mem1_rd_addr_reg        <= 'd0;
            mem1_control_bits_reg   <= 'd0;
            mem1_pc_reg             <= 'd0;
        end else begin
            if(mem1_stall_en) begin
                mem1_alu_result_reg     <= mem1_alu_result_reg;
                mem1_rd_addr_reg        <= mem1_rd_addr_reg;
                mem1_control_bits_reg   <= mem1_control_bits_reg;
                mem1_pc_reg             <= mem1_pc_reg;
            end else begin
                mem1_alu_result_reg     <= alu_res_reg_i;
                mem1_rd_addr_reg        <= rd_addr_reg_i;
                mem1_control_bits_reg   <= control_bits_reg_i;
                mem1_pc_reg             <= pc_p4_reg_i;
            end 
        end
    end

    reg [31:0] rd_data_int;
    always @(*) begin
        case(mem1_control_bits_reg[`MEM_STRB_EN_BITS_BITS])
            2'd0 : rd_data_int = mem1_control_bits_reg[`MEM_NO_SIGN_EXTEND_BITS] ? ( {24'd0, mem_rdata_i[7:0]} ) : ( { {24{mem_rdata_i[7]}},  mem_rdata_i[7:0]} );
            2'd1 : rd_data_int = mem1_control_bits_reg[`MEM_NO_SIGN_EXTEND_BITS] ? ( {16'd0, mem_rdata_i[15:0]} ) : ( { {16{mem_rdata_i[15]}}, mem_rdata_i[15:0]} );
            2'd2 : rd_data_int = mem_rdata_i;
            default : rd_data_int = mem_rdata_i;
        endcase
    end


    // Memory 2 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            rd_val_reg_o <= 'd0;
            rd_addr_reg_o <= 'd0;
            wb_en_reg_o <= 'd0;
            pc_p4_reg_o <= 'd0;
        end else begin
            if(mem2_flush_en) begin
                rd_val_reg_o    <= 32'd0;
                rd_addr_reg_o   <= 5'd0;
                wb_en_reg_o     <= 1'b0;
                pc_p4_reg_o     <= 32'd0;
            end else begin
                rd_val_reg_o    <= mem1_control_bits_reg[`MEM_READ_EN_BITS] ? (rd_data_int) : (mem1_alu_result_reg);
                rd_addr_reg_o   <= mem1_rd_addr_reg;
                wb_en_reg_o     <= mem1_control_bits_reg[`WRITE_BACK_EN_BITS];
                pc_p4_reg_o     <= mem1_pc_reg;
            end
        end
    end


    assign mem1_rd_addr_reg_o[4:0]  = mem1_rd_addr_reg;
    assign mem1_control_bits_reg_o  = mem1_control_bits_reg[14:0];


endmodule