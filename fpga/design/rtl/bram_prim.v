module bram_prim #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10,
    parameter MEM_INIT_FILENAME = "None"
)(

    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *)
    input wire                      en_i, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *)
    output reg [DATA_WIDTH-1:0]     rdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *)
    input wire [DATA_WIDTH-1:0]     wdata_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *)
    input wire [3:0]                byte_wr_en_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *)
    input wire [ADDR_WIDTH-1:0]     addr_i, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *)
    input wire                      clk_i

);



    // Force synthesis tool to use Block RAM
    (* ram_style = "block" *) 
    reg [DATA_WIDTH-1:0] bram_r [(1 << ADDR_WIDTH)-1:0];
    
    generate 
    integer ram_index;
    initial begin
        
        for (ram_index = 0; ram_index < (1 << ADDR_WIDTH); ram_index = ram_index + 1) begin
            bram_r[ram_index] = 0;
        end

        $readmemh(MEM_INIT_FILENAME, bram_r);
    end
    endgenerate

    always @(posedge clk_i) begin
        if(en_i) begin
            if(byte_wr_en_i[0]) begin
                bram_r[addr_i][7:0] <= wdata_i[7:0];
            end
            if(byte_wr_en_i[1]) begin
                bram_r[addr_i][15:8] <= wdata_i[15:8];
            end
            if(byte_wr_en_i[2]) begin
                bram_r[addr_i][23:16] <= wdata_i[23:16];
            end
            if(byte_wr_en_i[3]) begin
                bram_r[addr_i][31:24] <= wdata_i[31:24];
            end

            rdata_o <= bram_r[addr_i];
        end
    end
endmodule