
// This file was generated with $ROOT/cpu/dv/scrpits/generate_opcode_assertions.py

`define COMPARE_ALL_INSTR ((instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxxxxxxxxxx0110111) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxxxxxxxxxx0010111) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxxxxxxxxxx1101111) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx000xxxxx1100111) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx000xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx001xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx100xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx101xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx110xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx111xxxxx1100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx000xxxxx0000011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx001xxxxx0000011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx010xxxxx0000011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx100xxxxx0000011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx101xxxxx0000011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx000xxxxx0100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx001xxxxx0100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx010xxxxx0100011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx000xxxxx0010011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx010xxxxx0010011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx011xxxxx0010011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx100xxxxx0010011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx110xxxxx0010011) || \
    (instruction[31:0] ==? 32'bxxxxxxxxxxxxxxxxx111xxxxx0010011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx001xxxxx0010011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx101xxxxx0010011) || \
    (instruction[31:0] ==? 32'b0100000xxxxxxxxxx101xxxxx0010011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx000xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0100000xxxxxxxxxx000xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx001xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx010xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx011xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx100xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx101xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0100000xxxxxxxxxx101xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx110xxxxx0110011) || \
    (instruction[31:0] ==? 32'b0000000xxxxxxxxxx111xxxxx0110011) || \
    (instruction[31:0] ==? 32'bx000xxxxxxxxxxxxx000xxxxx0001111) || \
    (instruction[31:0] ==? 32'b10000011001100000000000000001111) || \
    (instruction[31:0] ==? 32'b00000001000000000000000000001111) || \
    (instruction[31:0] ==? 32'b00000000000000000000000001110011) || \
    (instruction[31:0] ==? 32'b00000000000100000000000001110011)) 
