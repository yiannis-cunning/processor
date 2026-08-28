

`define MEM_SIZE_BYTES 32'h4000
`define MEM_SIZE_WORDS (`MEM_SIZE_BYTES >> 2)


/*
Map:

0x0000 - 0x0FFF // Bootload and End / ROM

0x1000 - 0x1FFF // .txt allocated - ICCM - load from iccm.hex

0x2000 - 0x2FFF // .data allocated - DCCM - load still from iccm.hex

0x3000 - 0x3FFF // Stack

rest - reserved.

*/

`include "risc_mem_cfg.svh"



module memory_top(
    input wire clk_i,
    input wire resetn_i,

    // INSTR I/F
    input wire [31:0]       instr_raddr_i,
    output logic  [31:0]    instr_data_o,
    input wire              instr_rd_en_i,

    // DATA I/F
    input  wire [31:0]  data_rd_addr_i,
    output logic [31:0] data_rd_data_o,
    input  wire         data_rd_en_i,
    input  wire [31:0]  data_wr_addr_i,
    input  wire [31:0]  data_wr_data_i,
    input  wire [3:0]   data_mem_strb_en_i,
    input  wire         data_wr_en_i

);

    /*
    ROM -> loads from rom.hex, may need adjustment with PROGRAM_START
    ICCM -> loads .text of program.
    DCCM -> loads .data of program. .bss Also?
    RAM -> Empty section - for stack
    */

    logic [`ICCM_ADDRW-1:0] iccm_raddr_int;
    logic [31:0] iccm_rdata_int;
    logic [`ROM_ADDRW-1:0] rom_raddr_int;
    logic [31:0] rom_rdata_int;

    sram #(
        .ADDRW(`ICCM_ADDRW),
        .MEM_INIT_FILENAME("iccm.hex"),
        .DATA_INIT_VAL(32'h00000013)
    ) I_iccm (
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .raddr_i(iccm_raddr_int),
        .rdata_o(iccm_rdata_int),
        .rd_en_i(instr_rd_en_i),
        
        .waddr_i('b0),
        .wdata_i(32'b0),
        .wr_en_i(1'b0),
        .strb_en_i(4'hF)
    );


    sram #(
        .ADDRW(`ROM_ADDRW),
        .MEM_INIT_FILENAME("rom.hex"),
        .DATA_INIT_VAL(32'h00000013)
    ) I_rom (
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .raddr_i(rom_raddr_int),
        .rdata_o(rom_rdata_int),
        .rd_en_i(instr_rd_en_i),
        
        .waddr_i('b0),
        .wdata_i(32'b0),
        .wr_en_i(1'b0),
        .strb_en_i(4'hF)
    );

    logic iccm_sel_en;
    reg iccm_sel_en_d1r;

    // Mux instruction port with rom/iccm
    // instr_data_o / instr_raddr_i
    always @(*) begin
        if( (instr_raddr_i[31:0] >= `ROM_START_ADDR) && ((instr_raddr_i[31:0] - `ROM_START_ADDR) < `ROM_SIZE) ) begin
            //instr_data_o = rom_rdata_int;
            iccm_sel_en = 1'b0;
        end else if( (instr_raddr_i[31:0] >= `ICCM_START_ADDR) && ((instr_raddr_i[31:0] - `ICCM_START_ADDR) < `ICCM_SIZE) ) begin
            //instr_data_o = iccm_rdata_int;
            iccm_sel_en = 1'b1;
        end else begin
            //instr_data_o = 32'b0;
            iccm_sel_en = 1'b0;
        end
        iccm_raddr_int[`ICCM_ADDRW-1:0] = (instr_raddr_i[31:0] - `ICCM_START_ADDR);
        rom_raddr_int[`ROM_ADDRW-1:0] = (instr_raddr_i[31:0] - `ROM_START_ADDR);
    end

    assign instr_data_o = (iccm_sel_en_d1r) ? (iccm_rdata_int) : (rom_rdata_int);


    logic [`DCCM_ADDRW-1:0] dccm_raddr_int;
    logic [31:0] dccm_rdata_int;
    logic dccm_rd_en_int;
    logic [`DCCM_ADDRW-1:0] dccm_waddr_int;
    logic dccm_wr_en_int;

    logic [`RAM_ADDRW-1:0] ram_raddr_int;
    logic [31:0] ram_rdata_int;
    logic ram_rd_en_int;
    logic [`RAM_ADDRW-1:0] ram_waddr_int;
    logic ram_wr_en_int;


    sram #(
        .ADDRW(`DCCM_ADDRW),
        .MEM_INIT_FILENAME("dccm.hex")
    ) I_dccm (
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .raddr_i(dccm_raddr_int),
        .rdata_o(dccm_rdata_int),
        .rd_en_i(dccm_rd_en_int),

        .waddr_i(dccm_waddr_int),
        .wdata_i(data_wr_data_i),
        .wr_en_i(dccm_wr_en_int),
        .strb_en_i(data_mem_strb_en_i)
    );


    sram #(
        .ADDRW(`RAM_ADDRW)
    ) I_ram (
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .raddr_i(ram_raddr_int),
        .rdata_o(ram_rdata_int),
        .rd_en_i(ram_rd_en_int),

        .waddr_i(ram_waddr_int),
        .wdata_i(data_wr_data_i),
        .wr_en_i(ram_wr_en_int),
        .strb_en_i(data_mem_strb_en_i)
    );



    logic dccm_sel_en;
    reg dccm_sel_en_d1r;

    always @(*) begin
        // R
        if( (data_rd_addr_i[31:0] >= `RAM_START_ADDR) && ((data_rd_addr_i[31:0] - `RAM_START_ADDR) < `RAM_SIZE) ) begin
            dccm_sel_en = 1'b0;
        end else if( (data_rd_addr_i[31:0] >= `DCCM_START_ADDR) && ((data_rd_addr_i[31:0] - `DCCM_START_ADDR) < `DCCM_SIZE) ) begin
            dccm_sel_en = 1'b1;
        end else begin
            dccm_sel_en = 1'b0;
        end
    end

    assign ram_rd_en_int    = (~dccm_sel_en) ? (data_rd_en_i) : (1'b0);
    assign dccm_rd_en_int   = (dccm_sel_en)  ? (data_rd_en_i) : (1'b0);

    assign ram_wr_en_int    = (~dccm_sel_en)  ? (data_wr_en_i) : (1'b0);
    assign dccm_wr_en_int   = (dccm_sel_en)   ? (data_wr_en_i) : (1'b0);


    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            dccm_sel_en_d1r <= 1'b0;
            iccm_sel_en_d1r <= 1'b0;
        end else begin
            dccm_sel_en_d1r <= dccm_sel_en;
            iccm_sel_en_d1r <= iccm_sel_en;
        end
    end

    assign data_rd_data_o[31:0] = (dccm_sel_en_d1r) ? (dccm_rdata_int) : (ram_rdata_int);

    always @(*) begin
        // unmuxed logic
        ram_raddr_int[`RAM_ADDRW-1:0] = (data_rd_addr_i[31:0] - `RAM_START_ADDR);
        ram_waddr_int[`RAM_ADDRW-1:0] = (data_wr_addr_i[31:0] - `RAM_START_ADDR);

        dccm_raddr_int[`DCCM_ADDRW-1:0] = (data_rd_addr_i[31:0] - `DCCM_START_ADDR);
        dccm_waddr_int[`DCCM_ADDRW-1:0] = (data_wr_addr_i[31:0] - `DCCM_START_ADDR);
    end






endmodule