
`define OP_ADD 0
`define OP_SUB 1
`define OP_XOR 2
`define OP_AND 3

module alu(
    input wire [31:0] val1,
    input wire [31:0] val2,

    input wire [4:0] operation,

    output wire [31:0] vout
);



    always @(*) begin
        case(operation)
            `OP_ADD : vout = val1 + val2;
            `OP_SUB : vout = val1 - val2;
            `OP_XOR : vout = val1 ^ val2;
            `OP_AND : vout = val1 & val2
            default : vout = 32'b0;
        endcase
    end


endmodule