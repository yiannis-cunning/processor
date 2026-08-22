


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
    logic [7:0] mem_bytes [MEM_SIZE_B - 1:0];

    always @(*) begin
        for (integer i = 0; i <= MEM_SIZE_W - 1; i += 1) begin    
            mem_bytes[(i << 2) + 0] = mem_r[i][7:0];
            mem_bytes[(i << 2) + 1] = mem_r[i][15:8];
            mem_bytes[(i << 2) + 2] = mem_r[i][23:16];
            mem_bytes[(i << 2) + 3] = mem_r[i][31:24];
        end
    end


    initial begin
        for (integer i = 0; i <= MEM_SIZE_W - 1; i += 1) begin    
            mem_r[i] = DATA_INIT_VAL;
        end

        if(MEM_INIT_FILENAME != "None") begin
            // Bootload code 
            $readmemh(MEM_INIT_FILENAME, mem_r, 0, MEM_SIZE_W - 1);
        end

    end


    logic [ADDRW - 1:0] word_addr_eff;
    logic [1:0] word_byte_sel_eff;

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin

        end else if(wr_en_i) begin
            for (integer i = 0; i <= 3; i += 1) begin  
                if(strb_en_i[i] == 1'b1) begin
                    word_addr_eff = (waddr_i + i) >> 2;
                    word_byte_sel_eff = (waddr_i + i) & 'h3;

                    mem_r[word_addr_eff][word_byte_sel_eff*8 +: 8] <= wdata_i[i*8+:8];
                end
            end

            //mem_r[waddr_i[ADDRW-1:2]][7:0]   <= strb_en_i[0] ? (wdata_i[7:0])   : (mem_r[waddr_i[ADDRW-1:2]][7:0]);
            //mem_r[waddr_i[ADDRW-1:2]][15:8]  <= strb_en_i[1] ? (wdata_i[15:8])  : (mem_r[waddr_i[ADDRW-1:2]][15:8]);
            //mem_r[waddr_i[ADDRW-1:2]][23:16] <= strb_en_i[2] ? (wdata_i[23:16]) : (mem_r[waddr_i[ADDRW-1:2]][23:16]);
            //mem_r[waddr_i[ADDRW-1:2]][31:24] <= strb_en_i[3] ? (wdata_i[31:24]) : (mem_r[waddr_i[ADDRW-1:2]][31:24]);  
        end
    end


    always @(*) begin
        //rdata_o = mem_r[raddr_i[ADDRW-1:2]];
        for (integer i = 0; i <= 3; i += 1) begin    
            if(strb_en_i[i] == 1'b1)
                rdata_o[i*8 +: 8] = mem_bytes[raddr_i + i];
            else
                rdata_o[i*8 +: 8] = 8'b0;
        end
    end



endmodule