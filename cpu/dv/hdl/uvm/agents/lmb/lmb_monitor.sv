class lmb_monitor extends uvm_monitor;
    `uvm_component_utils(lmb_monitor)

    virtual lmb_if  vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual lmb_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "lmb_if not set")

    endfunction

    function void connect_phase(uvm_phase phase);

    endfunction
endclass