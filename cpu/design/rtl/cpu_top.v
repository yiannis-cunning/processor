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
    output wire             iccm_addrstrobe_o, // Address strobe (required)
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
    output wire [3:0]       dccm_wr_byte_en_o,
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M ADDRSTROBE" *)
    output wire             dccm_addrstrobe_o, // Address strobe (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M READY" *)
    input wire              dccm_ready_i, // Ready (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M WAIT" *)
    input wire              dccm_wait_i // Wait (optional)
    
);


    // ICCM write port always 0
    assign iccm_wdata_o = 32'd0;
    assign iccm_wr_en_o = 1'b0;
    assign iccm_wr_byte_en_i = 4'b0;
    assign iccm_addrstrobe_o = iccm_rd_en_o;

    assign dccm_addrstrobe_o = dccm_rd_en_o | dccm_wr_en_o;

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
        
        .mem_addr_o(dccm_addr_o),
        .mem_rdata_i(dccm_rdata_i),
        .mem_rd_en_o(dccm_rd_en_o),
        .mem_wdata_o(dccm_wdata_o),
        .mem_strb_en_o(dccm_wr_byte_en_o),
        .mem_wr_en_o(dccm_wr_en_o),
        .mem_ready_i(dccm_ready_i),
        .mem_wait_i(dccm_wait_i)

    );


endmodule