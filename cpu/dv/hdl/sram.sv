


module sram #(
    parameter ADDRW = 10,
    parameter MEM_INIT_FILENAME = "None",
    parameter DATA_INIT_VAL = 32'b0

)(
    input wire clk_i,
    input wire resetn_i,


    input wire [ADDRW-1:0]      raddr_i,
    output logic  [31:0]         rdata_o,
    input wire                  rd_en_i,

    input wire [ADDRW-1:0]      waddr_i,
    input wire [31:0]           wdata_i,
    input wire                  wr_en_i,
    input wire [3:0]            strb_en_i
);

    // mem size b = 1 << ADDRW
    localparam MEM_SIZE_B = (1 << ADDRW);
    localparam MEM_SIZE_W = MEM_SIZE_B >> 2;

    logic [31:0] mem_r  [MEM_SIZE_W - 1 :0];


    initial begin
        for (integer i = 0; i <= MEM_SIZE_W - 1; i += 1) begin    
            mem_r[i] = DATA_INIT_VAL;
        end

        if(MEM_INIT_FILENAME != "None") begin
            // Bootload code 
            $readmemh(MEM_INIT_FILENAME, mem_r, 0, MEM_SIZE_W - 1);
        end

    end

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin

        end else if(wr_en_i) begin
            mem_r[waddr_i[ADDRW-1:2]][7:0]   <= strb_en_i[0] ? (wdata_i[7:0])   : (mem_r[waddr_i[ADDRW-1:2]][7:0]);
            mem_r[waddr_i[ADDRW-1:2]][15:8]  <= strb_en_i[1] ? (wdata_i[15:8])  : (mem_r[waddr_i[ADDRW-1:2]][15:8]);
            mem_r[waddr_i[ADDRW-1:2]][23:16] <= strb_en_i[2] ? (wdata_i[23:16]) : (mem_r[waddr_i[ADDRW-1:2]][23:16]);
            mem_r[waddr_i[ADDRW-1:2]][31:24] <= strb_en_i[3] ? (wdata_i[31:24]) : (mem_r[waddr_i[ADDRW-1:2]][31:24]);  
        end
    end


    always @(*) begin
        rdata_o = mem_r[raddr_i[ADDRW-1:2]];
    end


endmodule