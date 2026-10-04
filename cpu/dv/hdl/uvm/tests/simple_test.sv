
class simple_test extends uvm_test;
  `uvm_component_utils(simple_test)

  cpu_env             env;
  virtual cpu_if      cpu_vif;
  virtual sram_dbg_if dccm_dbg_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Make the environment
    env = cpu_env::type_id::create("env", this);

    // Try and get the references to the physical interfaces
    if (!uvm_config_db#(virtual cpu_if)::get(this, "", "cpu_vif", cpu_vif))
      `uvm_fatal("NOVIF", "cpu_vif not set")
    if (!uvm_config_db#(virtual sram_dbg_if)::get(this, "", "dccm_dbg_vif", dccm_dbg_vif))
      `uvm_fatal("NOVIF", "dccm_dbg_vif not set")
  endfunction

  task run_phase(uvm_phase phase);
    topseq seq = topseq::type_id::create("seq");
    phase.raise_objection(this);       // keeps the sim alive until the seq finishes
    seq.cpu_vif      = cpu_vif;
    seq.dccm_dbg_vif = dccm_dbg_vif;
    seq.start(null);                   // no sequencer: it drives the vif directly
    phase.drop_objection(this);
  endtask
endclass