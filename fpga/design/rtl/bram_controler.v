


module bram_controller #(
    parameter BASE_ADDR = 0,
    parameter WORD_ADDR_W = 10
    ) (
    input wire clk_i,
    input wire resetn_i,

    // CPU mem I/F input - byte addressable - writes to addr +: num_bytes
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT ABUS" *)
    input wire [31:0]       addr_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITEDBUS" *)
    input wire [31:0]       wdata_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READDBUS" *)
    output reg [31:0]       rdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITESTROBE" *)
    input wire              wr_en_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READSTROBE" *)
    input wire              rd_en_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT BE" *)
    input wire [3:0]        wr_byte_en_i,


    // BRAM Controller output - word addressable
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *)
    (* X_INTERFACE_MODE = "Master" *)
    // Uncomment the following to set interface specific parameter on the bus interface.MEM_ECC <value>,,MEM_SIZE <value>,READ_WRITE_MODE <value>
    //(* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_WIDTH 32, MEM_SIZE 1024" *)
    output wire                  bram_en_o, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *)
    input wire [31:0]            bram_rdata_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *)
    output reg [31:0]           bram_wdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *)
    output wire [3:0]            bram_byte_wr_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *)
    output wire [WORD_ADDR_W-1:0]           bram_addr_o, 
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *)
    output wire                 bram_clk_o 


    );
    parameter HIGH_ADDR = (1 << (WORD_ADDR_W + 2)) + BASE_ADDR;
    reg [31:0] bram_addr_int;
    reg in_addr_range;

    reg [31:0] bram_raddr_d1r;
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            bram_raddr_d1r <= 32'b0;
        end else begin
            if(rd_en_i) begin   // Assume rd_en and wr_en are not both on at same time.
                bram_raddr_d1r <= addr_i;
            end
        end
    end

    // Data shifting
    always @(*) begin
        rdata_o = bram_rdata_i >> ({1'b0, bram_raddr_d1r[1:0], 3'b0});  // bram_raddr_d1r should be the address that was used to collect rdata
        bram_wdata_o = wdata_i << ({1'b0, addr_i[1:0], 3'b0});
    end

    // Address translation
    always @(*) begin
        bram_addr_int = addr_i - BASE_ADDR;              // Addr Offset - assume always within range
        bram_addr_int = {2'b0, bram_addr_int[31:2]};            // Byte -> Word addr, round down
    end

    always @(*) begin
        in_addr_range = (addr_i >= BASE_ADDR) & (addr_i < HIGH_ADDR);
    end

    assign bram_addr_o = bram_addr_int[WORD_ADDR_W-1:0];

    // Static assignments
    assign bram_byte_wr_en_o = (wr_byte_en_i << addr_i[1:0] ) & {4{wr_en_i}} & {4{in_addr_range}};
    assign bram_en_o = wr_en_i | rd_en_i; // Generally CPU expects rd_data_i to stay constant until next access with rd_en high. Not how this works here as wr_en will also do a read. Not a issue as ICCM I/F does not writes.
    assign bram_clk_o = clk_i;
    

endmodule


// Add error signal ouput?
//  for out of bounds access, bad alignment
// Or if rd_en is on same time as wr_en