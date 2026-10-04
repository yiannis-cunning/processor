



interface lmb_if (input logic clk, input logic resetn);

    logic [31:0] lmb_addr;
    logic [31:0] lmb_wdatabus;
    logic [31:0] lmb_rdatabus;
    logic        lmb_readstrobe;
    logic        lmb_writestrobe;
    logic        lmb_addrstrobe;
    logic [3:0] lmb_byte_en;
    logic        lmb_ready;
    logic        lmb_wait;

endinterface