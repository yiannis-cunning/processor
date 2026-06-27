`define OP_ADD 0
`define OP_SLL 1
`define OP_SLT 2
`define OP_SLTU 3
`define OP_XOR 4
`define OP_SRL 5
`define OP_OR  6
`define OP_AND 7
`define OP_SUB 8
`define OP_SRA 9
`define OP_EQL 10

`define OP_OUTV2 'd15

module alu(
    input wire [31:0] val1,
    input wire [31:0] val2,

    input wire [4:0] operation,

    output reg [31:0] vout
);

    always @(*) begin
        case(operation)
            `OP_ADD : vout = val1 + val2;
            `OP_SUB : vout = val1 - val2;
            `OP_XOR : vout = val1 ^ val2;
            `OP_AND : vout = val1 & val2;
            `OP_SLT : vout =  {31'b0, $signed(val1) < $signed(val2)};        //  Set less than
            `OP_SLTU : vout = {31'b0, $unsigned(val1) < $unsigned(val2) };                         //  Set less than unsigned
            `OP_EQL : vout =  {31'b0, val1 == val2 };
            `OP_SLL : vout = val1 << val2[4:0];
            `OP_SRL : vout = val1 >> val2[4:0];
            `OP_SRA : vout = val1 >>> val2[4:0];
            `OP_OUTV2 : vout = val2;
            default : vout = 32'b0;
        endcase
    end


endmodule