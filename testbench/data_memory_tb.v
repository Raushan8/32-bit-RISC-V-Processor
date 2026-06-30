`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 09:24:11
// Design Name: 
// Module Name: data_memory_tb
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

module data_memory_tb;

reg clk;
reg MemRead;
reg MemWrite;
reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

data_memory DUT(
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

// Clock
always #5 clk = ~clk;

initial begin

    clk = 0;
    MemRead = 0;
    MemWrite = 0;
    address = 0;
    write_data = 0;

    // Write 15 into Memory[0]
    #10;
    MemWrite = 1;
    address = 32'd0;
    write_data = 32'd15;

    #10;
    MemWrite = 0;

    // Read Memory[0]
    #10;
    MemRead = 1;
    address = 32'd0;

    #10;
    $display("----------------------");
    $display("Memory[0] = %d", read_data);
    $display("----------------------");

    #10;
    $finish;

end

endmodule