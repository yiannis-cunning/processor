


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

    input wire [4:0]    memory1_memory2_rd_addr_i,
    input wire          memory1_memory2_writeback_en,

    // To Fetch
    output wire hdu_dected_o

);

    // Each register stage:
    //      if(stall_nxt)
    //          reg <= reg
    //      if(~valid)
    //          reg <= reg_nxt
    //      if(stall)
    //          reg <= NOP
    //
    // stall_prev = stall
    // branch will set all valids before it to be 0

    // stall = prev_stall & ~prev_flush ? 
    
    input wire memory2_pause_req;
    input wire fetch2_wait_instr;        // = ~ ((ready | ~wait) & instr_valid) = trans_in_prog
    input wire execute_branch_req;
    input wire decode_puase_req;        // Due to instruction hazards from instructions in execute/memory1/memory2


    output wire memory2_stall_en_o = 1'b0;
    output wire memory2_flush_en_o = memory2_pause_req;

    output wire memory1_stall_en_o = memory2_pause_req;
    output wire memory1_flush_en_o = 1'b0;
    
    output wire execute_stall_en_o = memory2_pause_req;
    output wire execute_flush_en_o = 1'b0;

    output wire decode_stall_en_o = execute_stall_en_o;
    output wire decode_flush_en_o = (decode_puase_req & ~execute_stall_en_o) | (execute_branch_req & ~execute_stall_en_o);

    output wire fetch2_stall_en_o = decode_stall_en_o | decode_flush_en_o;
    output wire fetch2_flush_en_o =  (execute_branch_req) | (fetch2_wait_instr & ~fetch2_stall_en_o);

    output wire fetch1_stall_en_o = fetch2_flush_en_o | fetch2_stall_en_o;
    output wire fetch1_flush_en_o = (execute_branch_req);                   // Does not matter if branch_req is high for a few cycles when execute is stalled ->  NOPs will just be passed to fetch2


    wire [4:0] execute_rd_addr = decode_execute_writeback_en ? (decode_execute_rd_addr_i) : (5'd0);
    wire [4:0] memory_rd_addr = execute_memory_writeback_en ? (execute_memory_rd_addr_i) : (5'd0);
    wire [4:0] memory2_rd_addr = memory1_memory2_writeback_en ? (memory1_memory2_rd_addr_i) : (5'd0);


    assign hdu_dected_o =
        ( (decode_rs1_addr_used == execute_rd_addr) & (execute_rd_addr != 5'd0) ) ||
        ( (decode_rs2_addr_used == execute_rd_addr) & (execute_rd_addr != 5'd0) ) ||
        ( (decode_rs1_addr_used == memory_rd_addr) & (memory_rd_addr != 5'd0) ) ||
        ( (decode_rs2_addr_used == memory_rd_addr) & (memory_rd_addr != 5'd0) ) ||
        ( (decode_rs1_addr_used == memory2_rd_addr) & (memory2_rd_addr != 5'd0) ) ||
        ( (decode_rs2_addr_used == memory2_rd_addr) & (memory2_rd_addr != 5'd0) ) ;


endmodule