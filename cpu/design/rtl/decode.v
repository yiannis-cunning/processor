

`define PC_INIT 32'h100

`define OPCODE_INT_I    7'b0010011
`define OPCODE_INT_R    7'b0110011
`define OPCODE_LOAD     7'b0000011
`define OPCODE_STORE    7'b0100011
`define OPCODE_BRANCH   7'b1100011
`define OPCODE_JAL      7'b1101111
`define OPCODE_JALR     7'b1100111


module decode(
    input wire resetn_i,
    input wire clk_i,
    
    input wire flush_enable_i,


    // Decode input
    input wire [6:0] opcode_reg_i,
    input wire [31:0] instr_reg_i,
    input wire [31:0] pc_p4_reg_i,


    // Execute input 
    output reg [10:0]   control_bits_reg_o, // {swap_baddr_alures, branch_en_invert, branch_enable, immd_en, wb_en, mw_en, mr_en, alu_op[3:0]}
    output reg [31:0]   rs1_val_reg_o,
    output reg [31:0]   rs2_val_reg_o,
    output reg [31:0]   immd_val_reg_o,
    output reg [4:0]    rd_addr_reg_o,
    output reg [31:0]   pc_p4_reg_o,
    output reg [31:0]   br_dest_reg_o,


    // Writeback input
    input wire [4:0] rf_waddr1_i,
    input wire [31:0] rf_wdata1_i,
    input wire rf_wr_en_i,

    // To HDU
    output reg [4:0]  rs1_addr_used,
    output reg [4:0]  rs2_addr_used


);


    wire [31:0] rs1_val;
    wire [31:0] rs2_val;

    reg [10:0] lut_rd;
    reg [2:0] lut_immd_type;

    wire [31:0] b_encode_immd;
    wire [31:0] i_encode_immd;
    wire [31:0] s_encode_immd;
    wire [31:0] ip_encode_immd;
    wire [31:0] j_encode_immd;
    reg [31:0] immd_val_nxt;


    register_file I_rf(
        .resetn_i(resetn_i),
        .clk_i(clk_i),

        .raddr1_i(instr_reg_i[19:15]),   // Rs1
        .rdata1_i(rs1_val),

        .raddr2_i(instr_reg_i[24:20]),   // Rs2
        .rdata2_i(rs2_val),

        .waddr1_i(rf_waddr1_i),
        .wdata1_i(rf_wdata1_i),
        
        .wr_en_i(rf_wr_en_i)
    );


    // {immd_en, wb_en, mw_en, mr_en, alu_op[3:0]}
    always @(*) begin
        // ALU operation [3:0]
        case (opcode_reg_i[6:0])
            `OPCODE_INT_I   : lut_rd[3:0] = {instr_reg_i[30], instr_reg_i[14:12]};
            `OPCODE_INT_R   : lut_rd[3:0] = {instr_reg_i[30], instr_reg_i[14:12]};
            `OPCODE_BRANCH  : lut_rd[3:0] = (instr_reg_i[14:12] == 2'b00) ? (4'd10) : ( {2'b0, instr_reg_i[14:13]} );
            `OPCODE_JALR    : lut_rd[3:0] = 4'd0;
            default         : lut_rd[3:0] = 4'd0;
        endcase
        // Memory read enable
        lut_rd[4] = (opcode_reg_i[6:0] == `OPCODE_LOAD);
        // Memory write enable
        lut_rd[5] = (opcode_reg_i[6:0] == `OPCODE_STORE);
        // Write-back enable
        lut_rd[6] = (opcode_reg_i[6:0] == `OPCODE_INT_I) || (opcode_reg_i[6:0] == `OPCODE_INT_R) || (opcode_reg_i[6:0] == `OPCODE_LOAD) || 
                    (opcode_reg_i[6:0] == `OPCODE_JAL) || (opcode_reg_i[6:0] == `OPCODE_JALR);
        // Immediate enable for ALU
        lut_rd[7] = (opcode_reg_i[6:0] == `OPCODE_INT_I) || (opcode_reg_i[6:0] == `OPCODE_LOAD) || (opcode_reg_i[6:0] == `OPCODE_STORE) ||
                    (opcode_reg_i[6:0] == `OPCODE_JALR);
        // branch enable
        lut_rd[8] = (opcode_reg_i[6:0] == `OPCODE_BRANCH) || (opcode_reg_i[6:0] == `OPCODE_JALR) || (opcode_reg_i[6:0] == `OPCODE_JAL);
        // branch condition invert enable
        lut_rd[9] = instr_reg_i[12];
        // Swap alu result and pc_p4 in execute
        lut_rd[10] = (opcode_reg_i[6:0] == `OPCODE_JALR) || (opcode_reg_i[6:0] == `OPCODE_JAL);

        // Immediate type
        case (opcode_reg_i[6:0])
            `OPCODE_INT_I   : lut_immd_type[2:0] = 3'd1; // i-type
            `OPCODE_LOAD    : lut_immd_type[2:0] = 3'd1; // i-type
            `OPCODE_STORE   : lut_immd_type[2:0] = 3'd2; // s-type
            `OPCODE_JALR    : lut_immd_type[2:0] = 3'd4; // i-type + mask
            `OPCODE_JAL     : lut_immd_type[2:0] = 3'd5; // j-type
            `OPCODE_BRANCH  : lut_immd_type[2:0] = 3'd3; // b-type
            default         : lut_immd_type[2:0] = 3'd0;
        endcase
    end

    // To Hazard detection unit
    always @(*) begin
        rs1_addr_used = ~(   (opcode_reg_i[6:0] == `OPCODE_JAL)    ) ? (instr_reg_i[24:20]) : (5'd0);
        rs2_addr_used = (   (opcode_reg_i[6:0] == `OPCODE_INT_R) ||
                            (opcode_reg_i[6:0] == `OPCODE_LOAD)  ||
                            (opcode_reg_i[6:0] == `OPCODE_BRANCH)  ) ? (instr_reg_i[24:20]) : (5'd0);
    end



    // decode Immediate 
    assign b_encode_immd        = { {20{instr_reg_i[31]}}, instr_reg_i[7], instr_reg_i[30:25], instr_reg_i[11:8], 1'b0};    // B-type encoding 
    assign i_encode_immd        = { {21{instr_reg_i[31]}}, instr_reg_i[30:20]};                                             // I-type encoding 
    assign ip_encode_immd       = { {21{instr_reg_i[31]}}, instr_reg_i[30:21], 1'b0};                                       // I-type encoding + with LSB masked
    assign s_encode_immd        = { {21{instr_reg_i[31]}}, instr_reg_i[30:25], instr_reg_i[11:7]};                          // S-type encoding 
    assign j_encode_immd        = { {12{instr_reg_i[31]}}, instr_reg_i[19:12], instr_reg_i[20], instr_reg_i[30:21], 1'b0};  // J-type encoding

    always @(*) begin
        case(lut_immd_type)
            'd0 : immd_val_nxt = 32'd0;                 // R-type, No immediate
            'd1 : immd_val_nxt = i_encode_immd;
            'd2 : immd_val_nxt = s_encode_immd;
            'd3 : immd_val_nxt = b_encode_immd;
            'd4 : immd_val_nxt = ip_encode_immd;        // I-type encoding + with LSB masked
            'd5 : immd_val_nxt = j_encode_immd;
            default : immd_val_nxt = 32'd0;             // No immediate
        endcase
    end


    // Fetch/Decode registers
    always @(posedge clk_i, negedge resetn_i) begin
        if(~resetn_i) begin
            control_bits_reg_o  <= 'd0;
            rs1_val_reg_o       <= 'd0;
            rs2_val_reg_o       <= 'd0;
            rd_addr_reg_o       <= 'd0;
            pc_p4_reg_o         <= 'd0;
            br_dest_reg_o       <= 'd0;
            immd_val_reg_o      <= 'd0;
        end else begin
            // {wb_en, mw_en, mr_en, alu_op[3:0]}
            control_bits_reg_o[10:0]  <= (flush_enable_i) ? ('d0) : (lut_rd);

            rs1_val_reg_o       <= rs1_val;
            rs2_val_reg_o       <= rs2_val;
            rd_addr_reg_o       <= instr_reg_i[11:7];
            pc_p4_reg_o         <= pc_p4_reg_i;
            br_dest_reg_o       <= pc_p4_reg_i - 32'd4 + immd_val_nxt;
            immd_val_reg_o      <= immd_val_nxt;
        end
    end


endmodule