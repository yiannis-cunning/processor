`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2026 12:11:17 PM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux #(
    parameter dir = 0
) (
    input [31:0] a,
    input [31:0] b,
    input s,
    output [31:0] c
    );
    
    assign c = (s ^ dir) ? (b) : (a);
endmodule
