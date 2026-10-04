// `include "cpu_mem_map.vh"

module cpu_top(

    input wire resetn_i,
    input wire clk_i,

    input wire run_req_i,
    output wire done_state,

    // Instruction mem RO interface
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M ABUS" *)
    (* X_INTERFACE_MODE = "Master" *)
    output wire [31:0]      iccm_word_raddr_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M WRITEDBUS" *)
    output wire [31:0]      iccm_wdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M READDBUS" *)
    input wire  [31:0]      iccm_data_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M WRITESTROBE" *)
    output wire             iccm_wr_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M READSTROBE" *)
    output wire             iccm_rd_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M BE" *)
    output wire [3:0]       iccm_wr_byte_en_i,

    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M ADDRSTROBE" *)
    output wire             iccm_addrstrobe, // Address strobe (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M READY" *)
    input wire              iccm_ready_i, // Ready (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M WAIT" *)
    input wire              iccm_wait_i, // Wait (optional)

    // Data mem R/W Interface
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M ABUS" *)
    (* X_INTERFACE_MODE = "Master" *)
    output wire [31:0]      dccm_addr_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M WRITEDBUS" *)
    output wire [31:0]      dccm_wdata_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M READDBUS" *)
    input  wire [31:0]      dccm_rdata_i,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M WRITESTROBE" *)
    output wire             dccm_wr_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M READSTROBE" *)
    output wire             dccm_rd_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M BE" *)
    output wire [3:0]       dccm_wr_byte_en_i
    
);

    wire [31:0] data_rd_addr_int;
    wire [31:0] data_wr_addr_int;

    assign dccm_addr_o = (dccm_wr_en_o) ? (data_wr_addr_int) : (data_rd_addr_int);

    assign iccm_wdata_o = 32'd0;
    assign iccm_wr_en_o = 1'b0;
    assign iccm_wr_byte_en_i = 4'b0;
    assign iccm_addrstrobe = iccm_rd_en_o;

    pipeline_top pipeline (
        .resetn_i(resetn_i),
        .clk_i(clk_i),
        .run_req_i(run_req_i),
        .done_state(done_state),

        .instr_raddr_o(iccm_word_raddr_o),
        .instr_data_i(iccm_data_i),
        .instr_rd_en_o(iccm_rd_en_o),
        .instr_rd_wait_i(iccm_wait_i),
        .instr_rd_ready_i(iccm_ready_i),
        

        .data_rd_addr_o(data_rd_addr_int),
        .data_rd_data_i(dccm_rdata_i),
        .data_rd_en_o(dccm_rd_en_o),

        .data_wr_addr_o(data_wr_addr_int),
        .data_wr_data_o(dccm_wdata_o),
        .data_wr_en_o(dccm_wr_en_o),

        .data_mem_strb_en_o(dccm_wr_byte_en_i)
    );


endmodule