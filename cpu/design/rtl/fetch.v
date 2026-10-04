


`include "cpu_defines.vh"

module fetch(
    input wire resetn_i,
    input wire clk_i,
    input wire run_req_i,


    // Fetch/Decode registers
    output wire [31:0]       instr_reg_o,
    output wire [31:0]       pc_p4_reg_o,

    // Instruction RO interface
    output wire [31:0]      instr_raddr_o,
    input wire  [31:0]      instr_rdata_i,
    output wire             instr_rd_en_o,
    input wire              instr_rd_wait_i,
    input wire              instr_rd_ready_i,

    // From Execute
    input wire              branch_enable_i,
    input wire [31:0]       pc_dest_i,
    input wire              stall_enable_i

);

    reg [31:0] pc;
    wire run_req_int;
    
    reg [31:0] fetch1_pc_p4_r;
    reg fetch1_instr_valid;
    wire fetch1_stall_en = stall_enable_i | (~instr_rd_ready_i & instr_rd_wait_i);
    wire fetch1_flush_en = branch_enable_i | (~run_req_int);

    assign run_req_int = run_req_i | fetch1_stall_en;

    reg [31:0] fetch2_pc_p4_r;
    reg [31:0] fetch2_instr_r;
    wire fetch2_flush_en = branch_enable_i; 
    wire fetch2_stall_en = stall_enable_i;


    // ICCM I/F
    assign instr_raddr_o = pc;
    assign instr_rd_en_o = ~fetch1_stall_en & ~fetch1_flush_en;

    // PC register
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            pc <= `PC_INIT;
        end else begin
            if(run_req_int) begin
                pc <= branch_enable_i ? (pc_dest_i) : ( fetch1_stall_en ? (pc) : (pc + 32'd4) );
            end
        end
    end

    // Fetch 1 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            fetch1_pc_p4_r          <= 32'd0;
            fetch1_instr_valid      <= 1'd0;
        end else begin
            if(fetch1_flush_en) begin
                fetch1_pc_p4_r      <= 32'd0;
                fetch1_instr_valid  <= 1'd0;
            end else begin
                if(fetch1_stall_en) begin
                    fetch1_pc_p4_r      <= fetch1_pc_p4_r;
                    fetch1_instr_valid  <= fetch1_instr_valid;
                end else begin
                    fetch1_pc_p4_r      <= pc + 32'd4;
                    fetch1_instr_valid  <= 1'b1;
                end
            end
            
        end
    end


    // Fetch 2 registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            fetch2_pc_p4_r          <= 32'd0;
            fetch2_instr_r          <= `INSTR_NOP;
        end else begin
            if(fetch2_flush_en) begin
                fetch2_pc_p4_r    <= 32'd0;
                fetch2_instr_r    <= `INSTR_NOP;
            end else begin
                if(fetch2_stall_en) begin
                    fetch2_pc_p4_r  <= fetch2_pc_p4_r;
                    fetch2_instr_r  <= fetch2_instr_r;
                end else begin
                    fetch2_pc_p4_r  <= fetch1_pc_p4_r;
                    fetch2_instr_r  <= (fetch1_instr_valid & (~instr_rd_wait_i | instr_rd_ready_i) ) ? (instr_rdata_i[31:0]) : (`INSTR_NOP);
                end
            end
        end
    end

    assign instr_reg_o[31:0] = fetch2_instr_r;
    assign pc_p4_reg_o = fetch2_pc_p4_r;

endmodule