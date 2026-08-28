


`include "cpu_defines.vh"

module fetch(
    input wire resetn_i,
    input wire clk_i,
    input wire run_req_i,


    // Fetch/Decode registers
    output wire [31:0]      instr_reg_o,
    output reg [31:0]       pc_p4_reg_o,

    // Instruction RO interface
    output wire [31:0]      instr_raddr_o,
    input wire  [31:0]      instr_rdata_i,
    output wire             instr_rd_en_o,

    // From Execute
    input wire              branch_enable_i,
    input wire [31:0]       pc_dest_i,
    input wire              stall_enable_i

);


    reg [31:0] pc;
    reg instr_valid_r;


    assign instr_raddr_o = pc;
    assign instr_rd_en_o = ~stall_enable_i;

    // PC register
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            pc <= `PC_INIT;
        end else begin
            if(run_req_i) begin
                pc <= branch_enable_i ? (pc_dest_i) : ( stall_enable_i ? (pc) : (pc + 32'd4) );
            end
        end
    end

    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            pc_p4_reg_o         <= 32'd0;
            instr_valid_r       <= 1'b0;
        end else begin
            if((~stall_enable_i) | branch_enable_i) begin // brnach takes priority over stall
                pc_p4_reg_o         <= pc + 32'd4;
                instr_valid_r       <= ~branch_enable_i & run_req_i;
            end
            
        end
    end


    assign instr_reg_o[31:0] = (instr_valid_r) ? (instr_rdata_i[31:0]) : (`INSTR_NOP);

endmodule