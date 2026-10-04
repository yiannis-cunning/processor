class lmb_driver extends uvm_driver;
    `uvm_component_utils(lmb_driver)

    virtual lmb_if  vif;
    mem_model       mem;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual lmb_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "lmb_if not set")

    endfunction

    function void connect_phase(uvm_phase phase);

    endfunction

    task run_phase(uvm_phase phase);
        logic [31:0] addr_capt;
        logic [31:0] wdata_capt;
        logic [3:0]  be_capt;
        int unsigned n_waits;
        logic        we_capt;
        logic        re_capt;

        vif.lmb_ready       <= 'd0;
        vif.lmb_rdatabus    <= 'd0;
        vif.lmb_wait        <= 'd0;
        forever begin
            @(posedge vif.clk);


            if (!vif.resetn) begin
                vif.lmb_rdatabus    <= 'd0;
                vif.lmb_ready       <= 'd0;
                vif.lmb_wait        <= 'd0;
                continue;
            end

            if (vif.lmb_addrstrobe) begin
                
                if (!std::randomize(n_waits) with { n_waits dist { 0 :/ 35, [1:3] :/ 45, [4:10] :/ 20 }; })
                    `uvm_error("RAND", "randomize failed")

                addr_capt       = vif.lmb_addr;
                wdata_capt      = vif.lmb_wdatabus;
                be_capt         = vif.lmb_byte_en;
                we_capt         = vif.lmb_writestrobe;
                re_capt         = vif.lmb_readstrobe;

                if(n_waits != 0) begin
                    vif.lmb_wait    <= 1'b1;
                    vif.lmb_ready   <= 1'b0;
                end

                repeat (n_waits) @ (posedge vif.clk);

                if(re_capt)
                    vif.lmb_rdatabus <= mem.read( { addr_capt[31:2], 2'd0} ) >> {1'b0, addr_capt[1:0], 3'b0};
                else if(we_capt)
                    //mem.write({2'b0, addr_capt[31:2]}, wdata_capt, be_capt);
                    mem.write( { addr_capt[31:2], 2'd0},  wdata_capt << {1'b0, addr_capt[1:0], 3'b0}, be_capt << addr_capt[1:0] );
                
                vif.lmb_ready <= 1'b1;
                vif.lmb_wait  <= 1'b0;

            end else begin
                vif.lmb_ready   <= 1'b0;
            end
            
        end
    endtask

endclass