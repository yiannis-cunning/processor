/*
    * 32 x 32bit registers
    * Dual ported - 2x R/W interfaces

*/
module register_file(
    input wire resetn_i,
    input wire clk_i,

    // Read port 1
    input wire [4:0] raddr1_i,
    output wire [31:0] rdata1_i,

    // Read port 2
    input wire [4:0] raddr2_i,
    output wire [31:0] rdata2_i,

    // Write port 1
    input wire [4:0] waddr1_i,
    input wire [31:0] wdata1_i,
    input wire wr_en_i
);


    reg  [30:0] [31:0] registers;
    wire  [31:0] [31:0] registers_int;

    // R0 = 0
    always @(*) begin
        for (integer i = 0; i < 32; i += 1) begin
            if(i == 0) begin
                registers_int[i][31:0] = 32'b0;
            end else begin
                registers_int[i][31:0] = registers[i][31:0];
            end
        end
    end

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            registers <= 992'b0;
        end else begin
            if(wr_en_i & (waddr1_i != 'd0)) begin
                registers[waddr1_i - 1][31:0] = wdata1_i[31:0];
            end
        end
    end

    assign rdata1_i[31:0] = registers[raddr1_i][31:0];
    assign rdata2_i[31:0] = registers[raddr2_i][31:0];

endmodule