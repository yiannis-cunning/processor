


module lmb_to_axi (
    input wire sys_clk_i,
    input wire resetn_i,
    output reg mem_error_sticky_o,


    // S_CPU_LMB interface
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB ABUS" *)
    input [31:0]      lmb_addr_i, // Address bus (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB READSTROBE" *)
    input             lmb_readstrobe, // Read strobe (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB WRITESTROBE" *)
    input             lmb_writestrobe, // Write strobe (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB ADDRSTROBE" *)
    input             lmb_addrstrobe, // Address strobe (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB WRITEDBUS" *)
    input [31:0]      lmb_writedbus, // Write data bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB BE" *)
    input [3:0]       lmb_be, // Byte enable (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB READY" *)
    output reg        lmb_ready, // Ready (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB WAIT" *)
    output reg        lmb_wait, // Wait (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_CPU_LMB READDBUS" *)
    output reg [31:0] lmb_readdbus, // Read data bus (required)



    // AMBA A
    // M_AXI_BUS interface
    // Only keeping ports which also appear on the MIG
    // Uncomment the following to set interface specific parameter on the bus interface.
    //  (* X_INTERFACE_PARAMETER = "CLK_DOMAIN <value>,PHASE <value>,MAX_BURST_LENGTH <value>,NUM_WRITE_OUTSTANDING <value>,NUM_READ_OUTSTANDING <value>,SUPPORTS_NARROW_BURST <value>,READ_WRITE_MODE <value>,BUSER_WIDTH <value>,RUSER_WIDTH <value>,WUSER_WIDTH <value>,ARUSER_WIDTH <value>,AWUSER_WIDTH <value>,ADDR_WIDTH <value>,ID_WIDTH <value>,FREQ_HZ <value>,PROTOCOL <value>,DATA_WIDTH <value>,HAS_BURST <value>,HAS_CACHE <value>,HAS_LOCK <value>,HAS_PROT <value>,HAS_QOS <value>,HAS_REGION <value>,HAS_WSTRB <value>,HAS_BRESP <value>,HAS_RRESP <value>" *)

    // WA channel signals
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWID" *)
    output [3:0]            axi_awid, // Write address ID (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWADDR" *)
    output reg [31:0]       axi_awaddr, // Write address (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWLEN" *)
    output [7:0]            axi_awlen, // Burst length (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWSIZE" *)
    output [2:0]            axi_awsize, // Burst size (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWBURST" *)
    output [1:0]            axi_awburst, // Burst type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWLOCK" *)
    output [0:0]            axi_awlock, // Lock type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWCACHE" *)
    output [3:0]            axi_awcache, // Cache type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWPROT" *)
    output [2:0]            axi_awprot, // Protection type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWREGION" *)
    //output [3:0]            axi_awregion, // Write address slave region (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWQOS" *)
    output [3:0]            axi_awqos, // Transaction Quality of Service token (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWUSER" *)
    //output [<left_bound>:0] <s_awuser>, // Write address user sideband (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWVALID" *)
    output reg              axi_awvalid, // Write address valid (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS AWREADY" *)
    input                   axi_awready, // Write address ready (optional)


    // W channel signals
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WID" *)
    //output [3:0]            axi_wid, // Write ID tag (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WDATA" *)
    output reg [31:0]       axi_wdata, // Write data (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WSTRB" *)
    output reg [3:0]        axi_wstrb, // Write strobes (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WLAST" *)
    output                  axi_wlast, // Write last beat (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WUSER" *)
    //output [<left_bound>:0] axi_wuser, // Write data user sideband (optional    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WVALID" *)
    output reg              axi_wvalid, // Write valid (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS WREADY" *)
    input                   axi_wready, // Write ready (optional)


    // B channel signals
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS BID" *)
    input [3:0]             axi_bid, // Response ID (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS BRESP" *)
    input [1:0]             axi_bresp, // Write response (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS BUSER" *)
    //input [31:0]            axi_buser, // Write response user sideband (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS BVALID" *)
    input                   axi_bvalid, // Write response valid (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS BREADY" *)
    output reg              axi_bready, // Write response ready (optional)



    // AR channel signals
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARID" *)
    output [3:0]            axi_arid, // Read address ID (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARADDR" *)
    output reg [31:0]       axi_araddr, // Read address (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARLEN" *)
    output [7:0]            axi_arlen, // Burst length (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARSIZE" *)
    output [2:0]            axi_arsize, // Burst size (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARBURST" *)
    output [1:0]            axi_arburst, // Burst type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARLOCK" *)
    output [0:0]            axi_arlock, // Lock type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARCACHE" *)
    output [3:0]            axi_arcache, // Cache type (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARPROT" *)
    output [2:0]            axi_arprot, // Protection type (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARREGION" *)
    //output [3:0]            axi_arregion, // Read address slave region (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARQOS" *)
    output [3:0]            axi_arqos, // Quality of service token (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARUSER" *)
    //output [31:0]           axi_aruser, // Read address user sideband (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARVALID" *)
    output reg              axi_arvalid, // Read address valid (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS ARREADY" *)
    input                   axi_arready, // Read address ready (optional)


    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RID" *)
    input [3:0]         axi_rid, // Read ID tag (optional) - Ignore?
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RDATA" *)
    input [31:0]        axi_rdata, // Read data (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RRESP" *)
    input [1:0]         axi_rresp, // Read response (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RLAST" *)
    input               axi_rlast, // Read last beat (optional)
    //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RUSER" *)
    //input [31:0]        axi_ruser, // Read user sideband (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RVALID" *)
    input               axi_rvalid, // Read valid (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_BUS RREADY" *)
    output reg          axi_rready // Read ready (optional)




);




    // Doing a AXI transaction
    //  1) Drive all required outputs.
    //  2) Assert valid.
    //  3) Wait ready high.
    //  4) De-assert valid at the end of the clock cycle for all (4) interfaces. Capture all inputs.
    //  5) Check that the reponse is positive.


    // Write-Address (AW) Channel
    assign axi_awid[3:0]        = 4'd0;     // Only 1 transaction at a time.
    assign axi_awlen[7:0]       = 8'd0;     // No burst
    assign axi_awsize[2:0]      = 3'd2;     // 2**2 byte transactions
    assign axi_awburst[1:0]     = 2'd1;     // INC address
    assign axi_awlock           = 1'd0;     // Dont use.
    assign axi_awcache          = 4'd3;     // Normal, Non-cacheble, bufferable. Unclear if MIG uses this.
    assign axi_awprot[2:0]      = 3'd0;     // Probably dont care - read data access
    //assign axi_awregion[3:0]    = 4'd0;     // Probably dont care.
    assign axi_awqos[3:0]       = 4'd0;     // 0 means no scheme
    //reg [31:0]      axi_awaddr;
    //reg             axi_awvalid;

    // Write (W) Channel
    assign             axi_wlast = 1'd1;    // No burst
    //reg [31:0]      axi_wdata;
    //reg [3:0]       axi_wstrb;
    //reg             axi_wvalid;

    // Write Response (B) Channel
    //reg             axi_bready;

    // Read-Address (AR) channel
    assign axi_arid[3:0]        = 4'd0;     // Dont care.
    assign axi_arlen[7:0]       = 8'd0;     // No Bursts/busts of 1
    assign axi_arsize[2:0]      = 3'd2;     // 2**2 byte transactions
    assign axi_arburst[1:0]     = 2'd1;     // INC address
    assign axi_arlock           = 1'd0;     // Dont use
    assign axi_arcache[3:0]     = 4'd3;     // Normal, Non-cacheble, bufferable.
    assign axi_arprot[2:0]      = 3'd0;     // Probably dont care - read data access
    //assign axi_arregion[3:0]    = 4'd0;     // Probably dont care.
    assign axi_arqos[3:0]       = 4'd0;     // no scheme
    //reg [31:0]      axi_araddr;
    //reg             axi_arvalid;

    // R channel
    //reg             axi_rready;


    // LMB
    //reg             lmb_ready;
    //reg             lmb_wait;
    //reg [31:0]      lmb_readdbus;
    reg [1:0]       lmb_addr_lsb_sv;

    reg [1:0] axi_st;
    localparam ST_SETUP         = 2'd1;
    localparam ST_WAIT_ACK      = 2'd2;
    

    always @(posedge sys_clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            // Set all regs to 0
            axi_st      <= ST_SETUP;

            // LMB
            lmb_ready       <= 1'd0;
            lmb_wait        <= 1'd0;
            lmb_readdbus    <= 32'd0;
            lmb_addr_lsb_sv <= 2'd0;

            // AW
            axi_awaddr      <= 32'd0;
            axi_awvalid     <= 1'b0;
            // W
            axi_wdata       <= 32'd0;
            axi_wstrb       <= 4'd0;
            axi_wvalid      <= 1'd0;
            // B
            axi_bready      <= 1'd0;
            // AR
            axi_araddr      <= 32'd0;
            axi_arvalid     <= 1'd0;
            // R Channel
            axi_rready      <= 1'b0;


        end else begin
            case(axi_st)
                ST_SETUP : begin
                    // Phesudocode
                    // lmb_ready <= 0
                    // if(lmb_valid)
                    //      (cho_data) axi addr/data/strben/... <= lmb addr_i/data_i/....
                    //      cho_valid's <= 1
                    //      chi_ready's <= 1

                    if(lmb_addrstrobe) begin
                        lmb_ready <= 1'd0;
                        lmb_wait  <= 1'd1;
                        lmb_addr_lsb_sv <= lmb_addr_i[1:0];

                        // -- axi_awaddr      <= lmb_addr_i;        // write-address
                        axi_awaddr      <= {lmb_addr_i[31:2], 2'b00};    // Align to word boundry
                        axi_awvalid     <= lmb_writestrobe;     // write en
                        //-- axi_wdata       <= lmb_writedbus;
                        axi_wdata       <= lmb_writedbus << ({1'b0, lmb_addr_i[1:0], 3'b0});
                        //-- axi_wstrb       <= lmb_be;
                        axi_wstrb       <= lmb_be << lmb_addr_i[1:0];
                        axi_wvalid      <= lmb_writestrobe;
                        axi_bready      <= lmb_writestrobe;
                        axi_araddr      <= {lmb_addr_i[31:2], 2'b00};    // Align to word boundry
                        axi_arvalid     <= lmb_readstrobe;
                        axi_rready      <= lmb_readstrobe;

                        axi_st          <= ST_WAIT_ACK;
                    end else begin
                        lmb_ready   <= 1'd0;
                        lmb_wait    <= 1'd0;
                    end
                end
                ST_WAIT_ACK : begin
                    // Phesudocode
                    // for each channel
                    // if(cho_ready) cho_valid's <= 0
                    // if(chi_valid), capture data, chi_ready <= 0
                    //
                    // if(all ~cho_valid's and all ~chi_ready's) st <= ST_DONE
                    //      + error sig = f(bresp)
                    //      + lmb_ready <= 1
                    //      axi_st <= ST_SETUP 
                    //      

                    // Ouptut channels.
                    if(axi_awready) axi_awvalid <= 1'b0;
                    if(axi_wready) axi_wvalid <= 1'b0;
                    if(axi_arready) axi_arvalid <= 1'b0;

                    // Input channels
                    if(axi_bvalid & axi_bready) axi_bready <= 1'b0;
                    if(axi_rvalid & axi_rready) begin
                        lmb_readdbus <= axi_rdata >> {1'b0, lmb_addr_lsb_sv[1:0], 3'b0};
                        axi_rready <= 1'b0;
                    end

                    // Could look at input signals as optimization
                    if( {axi_awvalid, axi_wvalid, axi_arvalid, axi_bready, axi_rready} == 5'd0 ) begin
                        axi_st      <= ST_SETUP;
                        lmb_ready   <= 1'd1;    // Clear on next cycle.
                        lmb_wait    <= 1'd0;
                    end
                end
                default : axi_st <= ST_SETUP;
            endcase
        end
    end



    // Error checking - Just snoop on AXI responses - dont interrupt during failures.
    localparam E_RESP_OKAY   = 2'b00;
    localparam E_RESP_EXOKAY = 2'b01;
    localparam E_RESP_SLVERR = 2'b10;
    localparam E_RESP_DECERR = 2'b11;

    reg read_error_last, read_error_resp, write_error_resp;
    reg misaligned_write;
    reg misaligned_read;

    always @(posedge sys_clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            read_error_last <= 1'd0;
            read_error_resp <= 1'd0;
            write_error_resp <= 1'd0;
            misaligned_write <= 1'd0;
            misaligned_read  <= 1'd0;
            mem_error_sticky_o <= 1'd0;
        end else begin
            read_error_resp <= axi_rvalid & axi_rready & ((axi_rresp == E_RESP_SLVERR) | (axi_rresp == E_RESP_DECERR));
            read_error_last <= axi_rvalid & axi_rready & (~axi_rlast);
            write_error_resp <= axi_bvalid & axi_bready & ((axi_bresp == E_RESP_SLVERR) | (axi_bresp == E_RESP_DECERR));
            
            // 0000
            // 0001
            // 0011
            // 1111
            misaligned_write <= lmb_addrstrobe & lmb_writestrobe & ( 
                                (lmb_addr_i[1:0] == 2'b01) ? (lmb_be != 4'b0001) : 
                                (lmb_addr_i[1:0] == 2'b11) ? (lmb_be != 4'b0001) : 
                                (lmb_addr_i[1:0] == 2'b10) ? (lmb_be == 4'b1111) : 
                                (1'b0) );
            misaligned_read <= lmb_addrstrobe & lmb_readstrobe & ( 
                                (lmb_addr_i[1:0] == 2'b01) ? (lmb_be != 4'b0001) : 
                                (lmb_addr_i[1:0] == 2'b11) ? (lmb_be != 4'b0001) : 
                                (lmb_addr_i[1:0] == 2'b10) ? (lmb_be == 4'b1111) : 
                                (1'b0) );
            
            mem_error_sticky_o <= mem_error_sticky_o | read_error_resp | read_error_last | write_error_resp | misaligned_write | misaligned_read;
        end

    end

endmodule