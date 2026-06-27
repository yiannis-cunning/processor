


`include "cpu_defines.vh"

module fetch(
    input wire resetn_i,
    input wire clk_i,
    input wire run_req_i,


    // Fetch/Decode registers
    output reg [31:0]       instr_reg_o,
    output reg [31:0]       pc_p4_reg_o,

    // Instruction RO interface
    output wire [31:0]      instr_raddr_o,
    input wire  [31:0]      instr_rdata_i,

    // From Execute
    input wire              branch_enable_i,
    input wire [31:0]       pc_dest_i,
    input wire              stall_enable_i

);


    reg [31:0] pc;



    assign instr_raddr_o = pc;

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
            instr_reg_o     <= 32'h00000013;
            pc_p4_reg_o     <= 'd0;
        end else begin
            if(run_req_i) begin
                if(branch_enable_i) begin               // Flush on a branch
                    instr_reg_o     <= 32'h00000013;
                    pc_p4_reg_o     <= pc + 32'd4;
                end else if(stall_enable_i) begin       // Stall on a stall
                    instr_reg_o <= instr_reg_o;
                    pc_p4_reg_o <= pc_p4_reg_o;
                end else begin
                    instr_reg_o     <= instr_rdata_i[31:0];
                    pc_p4_reg_o     <= pc + 32'd4;
                end
            end else begin
                // Just pass NOP / ADD R0 R0
                instr_reg_o     <= 32'h00000013;    // {imm[11:0] = 0, rs1[4:0] = 0, b000, rd=0, opcode=add}
                pc_p4_reg_o     <= pc + 32'd4;
            end
        end
    end



endmodule