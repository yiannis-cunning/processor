


module lmb_mux #(
    parameter PORTA_ADDR_BASE = 0,
    parameter PORTA_ADDR_HIGH = 0,
    parameter PORTB_ADDR_BASE = 0,
    parameter PORTB_ADDR_HIGH = 0
    
    ) (
    //input wire clk_i,
    //input wire resetn_i,

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

    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A ABUS" *)
    (* X_INTERFACE_MODE = "Master" *)
    output wire [31:0]      dccm_addr_a_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITEDBUS" *)
    output wire [31:0]      dccm_wdata_a_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READDBUS" *)
    input  wire [31:0]      dccm_rdata_a_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITESTROBE" *)
    output wire             dccm_wr_en_a_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READSTROBE" *)
    output wire             dccm_rd_en_a_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A BE" *)
    output wire [3:0]       dccm_wr_byte_en_a_i,


    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B ABUS" *)
    (* X_INTERFACE_MODE = "Master" *)
    output wire [31:0]      dccm_addr_b_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITEDBUS" *)
    output wire [31:0]      dccm_wdata_b_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READDBUS" *)
    input  wire [31:0]      dccm_rdata_b_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITESTROBE" *)
    output wire             dccm_wr_en_b_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READSTROBE" *)
    output wire             dccm_rd_en_b_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B BE" *)
    output wire [3:0]       dccm_wr_byte_en_b_i

    );


    always @(*) begin
        if( (addr_i >= PORTA_ADDR_BASE) & (addr_i >= PORTA_ADDR_HIGH) ) begin
            rdata_o = dccm_rdata_a_i;
        end else if ( (addr_i >= PORTB_ADDR_BASE) & (addr_i >= PORTB_ADDR_HIGH) ) begin
            rdata_o = dccm_rdata_b_i;
        end else begin
            rdata_o = dccm_rdata_a_i;
        end
    end


    assign dccm_addr_b_o        = addr_i;
    assign dccm_wdata_b_o       = wdata_i;
    //assign dccm_rdata_b_i       = rdata_o
    assign dccm_wr_en_b_o       = wr_en_i;
    assign dccm_rd_en_b_o       = rd_en_i;
    assign dccm_wr_byte_en_b_i  = wr_byte_en_i;


    assign dccm_addr_a_o        = addr_i;
    assign dccm_wdata_a_o       = wdata_i;
    //assign dccm_rdata_a_i       = rdata_o
    assign dccm_wr_en_a_o       = wr_en_i;
    assign dccm_rd_en_a_o       = rd_en_i;
    assign dccm_wr_byte_en_a_i  = wr_byte_en_i;


endmodule
