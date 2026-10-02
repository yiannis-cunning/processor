


`include "cpu_defines.vh"

module fetch(
    input wire resetn_i,
    input wire clk_i,
    input wire run_req_i,


    // Fetch/Decode registers
    output wire [31:0]      instr_reg_o,
    output wire [31:0]       pc_p4_reg_o,

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
    
    reg [31:0] fetch1_pc_p4_r;
    reg branch_enable_d1r;

    reg [31:0] fetch2_pc_p4_r;
    reg [31:0] fetch2_instr_r;

    // ICCM I/F
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

    // Fetch 1 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            fetch1_pc_p4_r          <= 32'd0;
            branch_enable_d1r       <= 1'b0;
        end else begin
            branch_enable_d1r       <= branch_enable_i;
            if(branch_enable_i) begin
                fetch1_pc_p4_r      <= 32'd0;
            end else begin
                if(stall_enable_i) begin
                    fetch1_pc_p4_r  <= fetch1_pc_p4_r;
                end else begin
                    fetch1_pc_p4_r  <= pc + 32'd4;
                end
            end
            
        end
    end


    // Fetch 2 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            fetch2_pc_p4_r          <= 32'd0;
            fetch2_instr_r          <= 32'd0;
        end else begin
            if(branch_enable_i || branch_enable_d1r) begin
                fetch2_pc_p4_r    <= 32'd0;
                fetch2_instr_r    <= `INSTR_NOP;
            end else begin
                if(stall_enable_i) begin
                    fetch2_pc_p4_r  <= fetch2_pc_p4_r;
                    fetch2_instr_r  <= fetch2_instr_r;
                end else begin
                    fetch2_pc_p4_r  <= fetch1_pc_p4_r;
                    fetch2_instr_r  <= instr_rdata_i[31:0];
                end
            end
        end
    end

    assign instr_reg_o[31:0] = fetch2_instr_r;
    assign pc_p4_reg_o = fetch2_pc_p4_r;

endmodule