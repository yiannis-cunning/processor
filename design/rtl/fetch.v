

`define PC_INIT 32'h100


module fetch(
    input wire resetn_i,
    input wire clk_i,
    input wire run_req_i,


    // Fetch/Decode registers
    output wire [6:0] opcode_reg_o,
    output wire [31:0] instr_reg_o,
    output wire [31:0] pc_p4_reg_o;

    // Instruction RO interface
    output wire [31:0] instr_raddr_o,
    input wire  [31:0] instr_rdata_i

);


    reg [31:0] pc;
    reg [6:0] opcode_r,
    reg [24:0] instr_r,
    reg [31:0] pc_p4_r;

    // PC register
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            pc <= `PC_INIT;
        end else begin
            if(run_req_i) begin
                pc <= pc + 32'd4;
            end else begin
                pc <= `PC_INIT;
            end
        end
    end

    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            opcode_r <= 'd0;
            instr_r <= 'd0;
            pc_p4_r <= 'd0;
        end else begin
            if(run_req_i) begin
                instr_r  <= instr_data_i[31:7];
                opcode_r   <= instr_data_i[6:0];
                pc_p4_r   <= pc + 32'd4;
            end else begin
                // Just pass NOP / ADD R0 R0
                opcode_r  <= 7'b0010011;
                instr_r   <= 'd0; // {imm[11:0] = 0, rs1[4:0] = 0, b000, rd=0}
                pc_p4_r   <= pc + 32'd4;
            end
        end
    end


    assign instr_raddr_o = pc;

    assign opcode_reg_o = opcode_r;
    assign instr_reg_o = {instr_r, opcode_r};
    assign pc_p4_reg_o = pc_p4_r;

endmodule