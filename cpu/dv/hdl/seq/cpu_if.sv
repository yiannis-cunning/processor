



interface cpu_if ();
    logic resetn;
    logic clk;
    logic run_req_i;

    logic [31:0] instr_raddr_o;

endinterface