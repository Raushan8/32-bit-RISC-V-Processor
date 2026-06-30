`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 12:43:56
// Design Name: 
// Module Name: pc_tb
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

module pc(
    input clk,
    input rst,
    input [31:0] pc_next,
    output reg [31:0] pc
);

always @(posedge clk) begin
    if (rst)
        pc <= 32'd0;
    else
        pc <= pc_next;
end

endmodule
