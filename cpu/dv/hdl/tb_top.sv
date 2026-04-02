`timescale 1ns/1ps


/*
Map:

0x0000 - 0x00ff // reserved

0x0100 - 0x01ff // Bootload

0x0200 - 0x03ff // instruction mem

0x0400 - 0x04ff // reserved

0x0500 - 0x06ff // 4 Blocks data mem

0x0700 - +      // Rest reserved

*/


`define LOOP_ADDR 32'h128
`define INSTR_BASE_ADDR 32'h0200
`define INSTR_SIZE 32'h0200
`define DATA_BASE_ADDR 32'h0500
`define DATA_SIZE 32'h0200



module tb_top;

    // -----------------------------
    // Testbench Signals
    // -----------------------------
    logic resetn_i;
    logic clk_i = 0;

    logic run_req_i;
    logic done_state;

    // Instruction memory interface
    logic [31:0] instr_raddr_o;
    logic [31:0] instr_data_i;

    // Data memory interface
    logic [31:0] data_rd_addr_o;
    logic [31:0] data_rd_data_i;
    logic        data_rd_en_o;
    logic [31:0] data_wr_addr_o;
    logic [31:0] data_wr_data_o;
    logic        data_wr_en_o;

    // -----------------------------
    // Memory Models
    // -----------------------------
    logic [31:0] main_mem  [0:1023];

    // -----------------------------
    // DUT Instance
    // -----------------------------
    pipeline_top dut (
        .resetn_i(resetn_i),
        .clk_i(clk_i),
        .run_req_i(run_req_i),
        .done_state(done_state),

        .instr_raddr_o(instr_raddr_o),
        .instr_data_i(instr_data_i),

        .data_rd_addr_o(data_rd_addr_o),
        .data_rd_data_i(data_rd_data_i),
        .data_rd_en_o(data_rd_en_o),

        .data_wr_addr_o(data_wr_addr_o),
        .data_wr_data_o(data_wr_data_o),
        .data_wr_en_o(data_wr_en_o)
    );

    initial forever #5ns clk_i = ~clk_i;  // 100 MHz

    initial begin
        resetn_i = 0;
        run_req_i = 0;

        #40;
        resetn_i = 1;

        #40;
        run_req_i = 1;

        //#100;
        //run_req_i = 0;
    end

    // Instruction read
    assign instr_data_i = main_mem[instr_raddr_o[11:2]]; 

    // Data memory
    assign data_rd_data_i = main_mem[data_rd_addr_o[11:2]];

    always @(posedge clk_i) begin
        if (data_wr_en_o) begin
            main_mem[data_wr_addr_o[11:2]] <= data_wr_data_o;
        end
    end

    wire [31:0] data_base_addr_int = `DATA_BASE_ADDR;
    wire [31:0] fin_loop_addr_int = `LOOP_ADDR;
    wire [13:0] branch_delta = {10'b1111111111, 4'b0100}; // -12 = (12 = 1100), -12 = ...110100

    wire [31:0] program_entry = 32'h200;

    // Init mem
    initial begin
        integer i;
        //$readmemh("instruction.hex", instr_mem);
        //$readmemh("data.hex", data_mem);
        for (i = 0; i < 1023; i++) begin    
            main_mem[i] = 32'h00000013; // NOP (ADDI x0,x0,0)
        end
        
        // sp = `DATA_BASE
        main_mem[64] = {data_base_addr_int[31:20], 5'h0, 3'b0, 5'h2, 7'b0010011};  // addi sp, s0, addr_lsbs
        main_mem[65] = {7'd0, 5'd12, 5'h2, 3'b001, 5'h2, 7'b0010011};             // sll sp, sp, 12
        main_mem[66] = {data_base_addr_int[19:8], 5'h2, 3'b0, 5'h2, 7'b0010011}; // addi sp, sp, addr_sbs
        main_mem[67] = {7'd0, 5'd8, 5'h2, 3'b001, 5'h2, 7'b0010011};             // sll sp, sp, 8
        main_mem[68] = {4'd0, data_base_addr_int[7:0], 5'h2, 3'b0, 5'h2, 7'b0010011}; // addi sp, sp, addr_sbs
        // ra = `LOOP_ADDR
        main_mem[69] = {fin_loop_addr_int[31:20], 5'h0, 3'b0, 5'h1, 7'b0010011};         // addi ra, s0, addr_lsbs
        main_mem[70] = {7'd0, 5'd12, 5'h1, 3'b001, 5'h1, 7'b0010011};                   // sll ra, ra, 12
        main_mem[71] = {fin_loop_addr_int[19:8], 5'h1, 3'b0, 5'h1, 7'b0010011};        // addi ra, ra, addr_sbs
        main_mem[72] = {7'd0, 5'd8, 5'h1, 3'b001, 5'h1, 7'b0010011};                   // sll ra, ra, 8
        main_mem[73] = {4'd0, fin_loop_addr_int[7:0], 5'h1, 3'b0, 5'h1, 7'b0010011};  // addi ra, ra, addr_sbs
        
        // Loop
        main_mem[74] = 32'h00000013;    // NOPs
        main_mem[75] = 32'h00000013;
        main_mem[76] = 32'h00000013;
        main_mem[77] = {branch_delta[12], branch_delta[10:5], 5'h0, 5'h0, 3'b0, branch_delta[4:1], branch_delta[11], 7'b1100011};


        // Start program at main_mem[128]

        // Last instrc is main_mem[255]
    end


    initial begin
        //wait(done_state);
        #500ns;
        $display("Program finished.");
        //$finish;
    end

endmodule