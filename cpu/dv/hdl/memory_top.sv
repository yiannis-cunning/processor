

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



module memory_top(
    input wire clk_i,
    input wire resetn_i,

    // ICCM I/F
    input wire [31:0] iccm_raddr_i,
    output logic  [31:0] iccm_data_o,

    // DCCM I/F
    input  wire [31:0] data_rd_addr_i,
    output logic [31:0] data_rd_data_o,
    input  wire        data_rd_en_i,
    input  wire [31:0] data_wr_addr_i,
    input  wire [31:0] data_wr_data_i,
    input  wire [3:0]  data_mem_strb_en_i,
    input  wire        data_wr_en_i

);

    /*
    iccm_mem I_iccm(
        .instr_raddr_i(instr_raddr_i),
        .instr_data_o(instr_data_o)
    );*/

    logic [31:0] iccm_mem  [`MEM_SIZE_WORDS-1 :0];


    initial begin
        /* ROM: 0x0000 - 0x0FFF */
        // Fill with NOPS
        for (integer i = 0; i < 4096 - 1; i+= 4) begin    
            iccm_mem[i >> 2] = 32'h00000013; // NOP (ADDI x0,x0,0)
        end
        // Bootload code 
        $readmemh("rom.hex", iccm_mem, 0, 1024);


        /* ICCM / ELF */
        for (integer i = 4096; i < 4096*3 - 1; i += 4) begin    
            iccm_mem[i >> 2] = 32'b0;
        end
        $readmemh("iccm.hex", iccm_mem, 1024, 3*1024);

        // Set stack = 0
        for (integer i = 4096*3; i < 4096*4 - 1; i += 4) begin    
            iccm_mem[i >> 2] = 32'b0;
        end

    end


    always @(*) begin
        if(iccm_raddr_i[31:0] < `MEM_SIZE_BYTES) begin
            iccm_data_o = iccm_mem[iccm_raddr_i[31:2]];
        end else begin
            iccm_data_o = 32'b0;
        end
    end


    always @(*) begin
        if( (data_rd_addr_i[31:0] <= `MEM_SIZE_BYTES) && (data_rd_en_i == 1'b1)) begin
            data_rd_data_o = iccm_mem[data_rd_addr_i[31:2]];
        end else begin
            data_rd_data_o = 32'b0;
        end
    end

    always @(posedge clk_i) begin
        if( (data_wr_addr_i[31:0] < `MEM_SIZE_BYTES) && (data_wr_en_i == 1'b1) ) begin
            iccm_mem[data_wr_addr_i[31:2]][7:0]   <= data_mem_strb_en_i[0] ? (data_wr_data_i[7:0])   : (iccm_mem[data_wr_addr_i[31:2]][7:0]);
            iccm_mem[data_wr_addr_i[31:2]][15:8]  <= data_mem_strb_en_i[1] ? (data_wr_data_i[15:8])  : (iccm_mem[data_wr_addr_i[31:2]][15:8]);
            iccm_mem[data_wr_addr_i[31:2]][23:16] <= data_mem_strb_en_i[2] ? (data_wr_data_i[23:16]) : (iccm_mem[data_wr_addr_i[31:2]][23:16]);
            iccm_mem[data_wr_addr_i[31:2]][31:24] <= data_mem_strb_en_i[3] ? (data_wr_data_i[31:24]) : (iccm_mem[data_wr_addr_i[31:2]][31:24]);
        end
    end


endmodule