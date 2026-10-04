class topseq extends uvm_sequence;
  `uvm_object_utils(topseq)

  virtual cpu_if      cpu_vif;       // set by the test before start()
  virtual sram_dbg_if dccm_dbg_vif;
  mem_model           memory;

  function new(string name = "topseq");
    super.new(name);
  endfunction

  task body();
    if (!uvm_config_db#(mem_model)::get(null, get_full_name(), "mem_model_if", memory))
      `uvm_fatal("NOMEM", "mem_model not found")

    reset_cpu();
    wait_for_done();
  endtask

  task reset_cpu();
    cpu_vif.resetn    <= 1'b0;
    cpu_vif.run_req_i <= 1'b0;
    repeat (3) @(posedge cpu_vif.clk);
    cpu_vif.resetn    <= 1'b1;
    repeat (2) @(posedge cpu_vif.clk);
    cpu_vif.run_req_i <= 1'b1;
  endtask

  task wait_for_done();
    fork
      begin
        wait (cpu_vif.instr_raddr_o == `PROGRAM_DONE_ADDRESS);
        `uvm_info("TOPSEQ", "PC reached end loop", UVM_LOW)
        memory.save("dccm_done.hex", `DCCM_START_ADDR, `TEST_SIZE_WORDS);
        //$writememh("dccm_done.hex", dccm_dbg_vif.mem_r, 0, `TEST_SIZE_WORDS - 1);
      end
      begin
        #200us;
        `uvm_error("TOPSEQ", "Test timeout")
      end
    join_any
    disable fork;
  endtask
endclass