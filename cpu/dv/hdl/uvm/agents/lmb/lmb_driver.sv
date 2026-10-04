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
        int unsigned n_waits;

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

            if (vif.lmb_addrstrobe && vif.lmb_readstrobe) begin
                
                if (!std::randomize(n_waits) with { n_waits dist { 0 :/ 35, [1:3] :/ 45, [4:10] :/ 20 }; })
                    `uvm_error("RAND", "randomize failed")

                addr_capt       = vif.lmb_addr;

                if(n_waits != 0) begin
                    vif.lmb_wait  <= 1'b1;
                    vif.lmb_ready   <= 1'b0;
                end

                repeat (n_waits) @ (posedge vif.clk);
                vif.lmb_rdatabus <= mem.read(addr_capt);
                vif.lmb_ready <= 1'b1;
                vif.lmb_wait  <= 1'b0;

            end else begin
                vif.lmb_ready   <= 1'b0;
            end
            
        end
    endtask

endclass