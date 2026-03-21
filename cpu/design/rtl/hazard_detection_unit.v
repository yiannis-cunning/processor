


module hazard_detection_unit(

    // From Decode
    input wire [4:0]   decode_rs1_addr_used,
    input wire [4:0]   decode_rs2_addr_used,
    
    // From Execute
    input wire [4:0]    decode_execute_rd_addr_i,
    input wire          decode_execute_writeback_en,

    // From Memory
    input wire [4:0]    execute_memory_rd_addr_i,
    input wire          execute_memory_writeback_en,

    // To Fetch
    output wire hdu_dected_o

);

    wire [4:0] execute_rd_addr = decode_execute_writeback_en ? (decode_execute_rd_addr_i) : (5'd0);
    wire [4:0] memory_rd_addr = execute_memory_writeback_en ? (execute_memory_rd_addr_i) : (5'd0);


    assign hdu_dected_o =
        ( (decode_rs1_addr_used == execute_rd_addr) & (execute_rd_addr != 5'd0) ) ||
        ( (decode_rs2_addr_used == execute_rd_addr) & (execute_rd_addr != 5'd0) ) ||
        ( (decode_rs1_addr_used == memory_rd_addr) & (memory_rd_addr != 5'd0) ) ||
        ( (decode_rs2_addr_used == memory_rd_addr) & (memory_rd_addr != 5'd0) );


endmodule