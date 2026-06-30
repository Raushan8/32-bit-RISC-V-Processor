`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 21:36:24
// Design Name: 
// Module Name: ALU_tb
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


module alu_tb;

reg [31:0] A;
reg [31:0] B;
reg [2:0]  ALU_Control;

wire [31:0] Result;
wire Zero;

alu dut(
    .A(A),
    .B(B),
    .ALU_Control(ALU_Control),
    .Result(Result),
    .Zero(Zero)
);

initial begin

    $monitor(
        "t=%0t Control=%b A=%d B=%d Result=%d Zero=%b",
        $time,ALU_Control,A,B,Result,Zero
    );

    ALU_Control = 3'b000; A = 10; B = 5;
    #5;

    ALU_Control = 3'b001; A = 10; B = 5;
    #5;

    ALU_Control = 3'b010; A = 15; B = 7;
    #5;

    ALU_Control = 3'b011; A = 12; B = 10;
    #5;

    ALU_Control = 3'b100; A = 9; B = 9;
    #5;

    $finish;

end

endmodule








 
