
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 04:40:39
// Design Name: 
// Module Name: Instruction_memory_tb
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


module instruction_memory_tb;

reg [31:0] pc;
wire [31:0] instruction;

instruction_memory dut(
    .pc(pc),
    .instruction(instruction)
);

initial begin

    $monitor(
        "t=%0t PC=%d Instruction=%h",
        $time,
        pc,
        instruction
    );

    pc = 0;
    #10;

    pc = 4;
    #10;

    pc = 8;
    #10;

    pc = 12;
    #10;

    $finish;

end

endmodule











