

module bram_gpio #(
    parameter IO_ADDRESS = 0,
    parameter WORD_ADDR_W = 5
    )(
    input clk_i,
    input resetn_i,

    // BRAM Controller output - word addressable
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *)
    //(* X_INTERFACE_MODE = "Slave" *)
    // Uncomment the following to set interface specific parameter on the bus interface.MEM_ECC <value>,,MEM_SIZE <value>,READ_WRITE_MODE <value>
    //(* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_WIDTH 32, MEM_SIZE 1024" *)
    //(* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL" *)
    input wire                      bram_en_i, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *)
    output reg [31:0]               bram_rdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *)
    input wire [31:0]               bram_wdata_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *)
    input wire [3:0]                bram_byte_wr_en_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *)
    input wire [WORD_ADDR_W-1:0]    bram_addr_i, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *)
    input wire                      bram_clk_i, 

    // GPIO
    input wire [31:0]       gpio_i,
    output reg [31:0]       gpio_o
);

    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            bram_rdata_o    <= 32'h0;
            gpio_o          <= 32'h0;
        end else begin


            if(bram_en_i & (bram_addr_i == IO_ADDRESS)) begin
                // Read GPIO
                bram_rdata_o <= gpio_i;

                // Write GPIO
                for(integer i = 0; i < 4; i = i + 1) begin
                    if(bram_byte_wr_en_i[i]) begin
                        gpio_o[8*i +: 8] <= bram_wdata_i[8*i +: 8];
                    end
                end
                
            end
        end
    end



endmodule