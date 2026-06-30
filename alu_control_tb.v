`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 22:04:47
// Design Name: 
// Module Name: ALU_control_tb
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

module control_unit_tb;

reg [6:0] opcode;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;

control_unit dut(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc)
);

initial begin

    $monitor(
        "t=%0t opcode=%b RegWrite=%b MemRead=%b MemWrite=%b ALUSrc=%b",
        $time,
        opcode,
        RegWrite,
        MemRead,
        MemWrite,
        ALUSrc
    );

    // ADD
    opcode = 7'b0110011;
    #10;

    // LW
    opcode = 7'b0000011;
    #10;

    // SW
    opcode = 7'b0100011;
    #10;

    // ADDI
    opcode = 7'b0010011;
    #10;

    // Invalid opcode
    opcode = 7'b1111111;
    #10;

    $finish;

end

endmodule
