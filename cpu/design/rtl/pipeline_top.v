


module pipeline_top(

    input wire resetn_i,
    input wire clk_i,

    input wire run_req_i,
    output wire done_state,
    //output wire [7:0] gpo,

    // Instruction mem RO interface
    output wire [31:0] instr_raddr_o,
    input wire  [31:0] instr_data_i,


    // Data mem R/W Interface
    output wire [31:0] data_rd_addr_o,
    input  wire [31:0] data_rd_data_i,
    output wire        data_rd_en_o,
    output wire [31:0] data_wr_addr_o,
    output wire [31:0] data_wr_data_o,
    output wire        data_wr_en_o

);







    // Fetch -> Decode interface
    wire [6:0]  fetch_decode_opcode_int;
    wire [31:0] fetch_decode_instr_int;
    wire [31:0] fetch_decode_pc_p4_int;

    // Decode -> Execute interface
    wire [9:0]  decode_execute_control_bits_int;
    wire [31:0] decode_execute_rs1_val_int;
    wire [31:0] decode_execute_rs2_val_int;
    wire [31:0] decode_execute_immd_val_int;
    wire [4:0]  decode_execute_rd_addr_int;
    wire [31:0] decode_execute_pc_p4_int;
    wire [31:0] decode_execute_br_dest_int;

    // Decode -> HDU interface
    wire [4:0] hdu_rs1_addr_used;
    wire [4:0] hdu_rs2_addr_used;
    wire       hazard_detected_int;

    // Execute -> Memory interface
    wire [2:0]  execute_memory_control_bits_int;
    wire [31:0] execute_memory_alu_res_int;
    wire [31:0] execute_memory_rs2_val_int;
    wire [4:0]  execute_memory_rd_addr_int;
    wire [31:0] execute_memory_pc_p4_int;

    wire        execute_branch_enable_int;
    wire [31:0] execute_decode_pc_dest_int;

    // Memory -> Writeback interface
    wire [31:0] memory_writeback_rd_val_int;
    wire [4:0]  memory_writeback_rd_addr_int;
    wire        memory_writeback_wb_en_int;
    wire [31:0] memory_writeback_pc_p4_int;


    fetch I_fetch(
        .clk_i(clk_i),
        .resetn_i(resetn_i),
        .run_req_i(run_req_i),
        .stall_enable_i(hazard_detected_int),

        .instr_raddr_o(instr_raddr_o),
        .instr_rdata_i(instr_data_i),
        
        // To Decode
        .opcode_reg_o(fetch_decode_opcode_int),
        .instr_reg_o(fetch_decode_instr_int),
        .pc_p4_reg_o(fetch_decode_pc_p4_int),

        // From Execute
        .branch_enable_i(execute_branch_enable_int),
        .pc_dest_i(execute_decode_pc_dest_int)

    );

    
    decode I_decode (
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        // Flush
        .flush_enable_i(execute_branch_enable_int || hazard_detected_int),

        // From Fetch
        .opcode_reg_i(fetch_decode_opcode_int),
        .instr_reg_i(fetch_decode_instr_int),
        .pc_p4_reg_i(fetch_decode_pc_p4_int),

        // To Execute
        .control_bits_reg_o(decode_execute_control_bits_int),
        .rs1_val_reg_o(decode_execute_rs1_val_int),
        .rs2_val_reg_o(decode_execute_rs2_val_int),
        .immd_val_reg_o(decode_execute_immd_val_int),
        .rd_addr_reg_o(decode_execute_rd_addr_int),
        .pc_p4_reg_o(decode_execute_pc_p4_int),
        .br_dest_reg_o(decode_execute_br_dest_int),

        // For Write-back
        .rf_waddr1_i(memory_writeback_rd_addr_int),
        .rf_wdata1_i(memory_writeback_rd_val_int),
        .rf_wr_en_i(memory_writeback_wb_en_int),

        // To Hazard detection unit
        .rs1_addr_used(hdu_rs1_addr_used),
        .rs2_addr_used(hdu_rs2_addr_used)
    );



    execute I_execute (
        .resetn_i(resetn_i),
        .clk_i(clk_i),

        // From Decode
        .control_bits_reg_i(decode_execute_control_bits_int),
        .rs1_val_reg_i(decode_execute_rs1_val_int),
        .rs2_val_reg_i(decode_execute_rs2_val_int),
        .immd_val_reg_i(decode_execute_immd_val_int),
        .rd_addr_reg_i(decode_execute_rd_addr_int),
        .pc_p4_reg_i(decode_execute_pc_p4_int),
        .br_dest_reg_i(decode_execute_br_dest_int),

        // To Memory
        .control_bits_reg_o(execute_memory_control_bits_int),
        .alu_res_reg_o(execute_memory_alu_res_int),
        .rs2_val_reg_o(execute_memory_rs2_val_int),
        .rd_addr_reg_o(execute_memory_rd_addr_int),
        .pc_p4_reg_o(execute_memory_pc_p4_int),

        // To fetch
        .branch_enable(execute_branch_enable_int),
        .pc_dest(execute_decode_pc_dest_int)
    );

    memory I_memory (
        .resetn_i(resetn_i),
        .clk_i(clk_i),

        // Data memory interface
        .rd_addr_o(data_rd_addr_o),
        .rd_data_i(data_rd_data_i),
        .rd_en_o(data_rd_en_o),
        .wr_addr_o(data_wr_addr_o),
        .wr_data_o(data_wr_data_o),
        .wr_en_o(data_wr_en_o),

        // From Execute
        .control_bits_reg_i(execute_memory_control_bits_int),
        .alu_res_reg_i(execute_memory_alu_res_int),
        .rs2_val_reg_i(execute_memory_rs2_val_int),
        .rd_addr_reg_i(execute_memory_rd_addr_int),
        .pc_p4_reg_i(execute_memory_pc_p4_int),

        // To Writeback
        .rd_val_reg_o(memory_writeback_rd_val_int),
        .rd_addr_reg_o(memory_writeback_rd_addr_int),
        .wb_en_reg_o(memory_writeback_wb_en_int),
        .pc_p4_reg_o(memory_writeback_pc_p4_int)
    );




    hazard_detection_unit I_hdu (
        // From Decode
        .decode_rs1_addr_used(hdu_rs1_addr_used),
        .decode_rs2_addr_used(hdu_rs2_addr_used),

        // From Execute
        .decode_execute_rd_addr_i(decode_execute_rd_addr_int),
        .decode_execute_writeback_en(decode_execute_control_bits_int[6]),

        // From Memory
        .execute_memory_rd_addr_i(execute_memory_rd_addr_int),
        .execute_memory_writeback_en(execute_memory_control_bits_int[2]),

        // To Fetch/Decode
        .hdu_dected_o(hazard_detected_int)
    );

endmodule