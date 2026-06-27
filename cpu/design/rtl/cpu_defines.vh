

// {branch_dest_for_alu_out, mem_load_unsigned, mem_strb_en[1:0], swap_baddr_alures, branch_en_invert, branch_enable, immd_en, wb_en, mw_en, mr_en, alu_op[3:0]}
`define NUM_CONTROL_BITS        15

`define ALU_CMD_BITS            3:0
`define MEM_READ_EN_BITS        4
`define MEM_WRITE_EN_BITS       5
`define WRITE_BACK_EN_BITS      6
`define IMMD_FOR_ALU2_BITS      7
`define BRANCH_CHK_EN_BITS      8
`define BRANCH_CHK_INV_EN_BITS  9
`define BRANCH_ADDR_SEL_BITS    10
`define MEM_STRB_EN_BITS_BITS   12:11
`define MEM_NO_SIGN_EXTEND_BITS 13
`define STORE_BRANCH_ADDR       14


// PC Start address
`define PC_INIT 32'h100

// Opcode defines
`define OPCODE_INT_I    7'b0010011
`define OPCODE_INT_R    7'b0110011
`define OPCODE_LOAD     7'b0000011
`define OPCODE_STORE    7'b0100011
`define OPCODE_BRANCH   7'b1100011
`define OPCODE_JAL      7'b1101111
`define OPCODE_JALR     7'b1100111
`define OPCODE_LUI      7'b0110111
`define OPCODE_AUIPC    7'b0010111

`define OPCODE_EBREAK   7'b1110011
`define OPCODE_ECALL    7'b1110011
