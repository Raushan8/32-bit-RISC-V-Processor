`timescale 1ns / 1ps




module instruction_memory(

    input [31:0] pc,

    output [31:0] instruction

);

reg[31:0] memory[0:255];
assign instruction= memory[pc>>2];
initial begin
    memory[0] = 32'h00500093; // ADDI x1,x0,5
    memory[1] = 32'h00A00113; // ADDI x2,x0,10
    memory[2] = 32'h002081B3; // ADD x3,x1,x2
end

endmodule
 