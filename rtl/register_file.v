`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 08:53:42
// Design Name: 
// Module Name: Register_file
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

module register_file(

   input clk,
   input RegWrite,

   input [4:0] rs1,
   input [4:0] rs2,
   input [4:0] rd,

   input [31:0] write_data,

   output [31:0] read_data1,
   output [31:0] read_data2

);

   reg [31:0] registers [0:31];

   assign read_data1 = registers[rs1];
   assign read_data2 = registers[rs2];

   always @(posedge clk)
   begin
      if (RegWrite && rd != 0)
         registers[rd] <= write_data;
   end

endmodule
   
   
   
   
   
   
   
   