class lmb_agent extends uvm_agent;
    `uvm_component_utils(lmb_agent)

    lmb_driver      drv;
    lmb_monitor     mon;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv = lmb_driver::type_id::create("drv", this);
        mon = lmb_monitor::type_id::create("mon", this);
    endfunction

    function void connect_phase(uvm_phase phase);

    endfunction
endclass