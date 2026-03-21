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


    integer i;

    reg  [31:0]  registers [31:0];

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            for(i = 0; i < 32; i=i+1) registers[i] = 'd0;
        end else begin
            if(wr_en_i & (waddr1_i != 'd0)) begin
                registers[waddr1_i][31:0] <= wdata1_i[31:0];
            end
        end
    end



    wire forward_detected_1 = (raddr1_i == waddr1_i) & wr_en_i & (raddr1_i != 5'd0);
    wire forward_detected_2 = (raddr2_i == waddr1_i) & wr_en_i & (raddr2_i != 5'd0);


    assign rdata1_i[31:0] = forward_detected_1 ? (wdata1_i) : (registers[raddr1_i][31:0]);
    assign rdata2_i[31:0] = forward_detected_2 ? (wdata1_i) : (registers[raddr2_i][31:0]);

endmodule