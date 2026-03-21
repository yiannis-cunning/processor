`timescale 1ns/1ps

module pipeline_top_tb;

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
    logic [31:0] instr_mem [0:1023];
    logic [31:0] data_mem  [0:1023];

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

        #100;
        run_req_i = 0;
    end

    // Instruction read
    assign instr_data_i = instr_mem[instr_raddr_o[11:2]]; 

    // Data memory
    assign data_rd_data_i = data_mem[data_rd_addr_o[11:2]];

    always @(posedge clk_i) begin
        if (data_wr_en_o) begin
            data_mem[data_wr_addr_o[11:2]] <= data_wr_data_o;
        end
    end

    // Init mem
    initial begin
        integer i;

        for (i = 0; i < 1024; i++) begin
            instr_mem[i] = 32'h00000013; // NOP (ADDI x0,x0,0)
            data_mem[i]  = 32'h0;
        end

        instr_mem[0] = 32'h00000013;
        instr_mem[1] = 32'h00000013;
        instr_mem[2] = 32'h00000013;
    end


    initial begin
        //wait(done_state);
        #200ns;
        $display("Program finished.");
        //$finish;
    end

endmodule