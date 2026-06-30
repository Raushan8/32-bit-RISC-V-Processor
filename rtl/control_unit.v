`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 12:51:17
// Design Name: 
// Module Name: ALU_control_unit
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


module alu_control(

    input [2:0] funct3,
    input [6:0] funct7,

    output reg [2:0] ALU_Control

);

always @(*) begin

    case({funct7,funct3})

        10'b0000000_000: ALU_Control = 3'b000; // ADD
        10'b0100000_000: ALU_Control = 3'b001; // SUB
        10'b0000000_111: ALU_Control = 3'b010; // AND
        10'b0000000_110: ALU_Control = 3'b011; // OR
        10'b0000000_100: ALU_Control = 3'b100; // XOR

        default: ALU_Control = 3'b000;

    endcase

end

endmodule
