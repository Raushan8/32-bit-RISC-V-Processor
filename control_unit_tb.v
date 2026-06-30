module alu_control_tb;

reg [2:0] funct3;
reg [6:0] funct7;

wire [2:0] ALU_Control;

alu_control dut(
    .funct3(funct3),
    .funct7(funct7),
    .ALU_Control(ALU_Control)
);

initial begin

    $monitor(
        "t=%0t funct7=%b funct3=%b ALU_Control=%b",
        $time,
        funct7,
        funct3,
        ALU_Control
    );

    // ADD
    funct7 = 7'b0000000;
    funct3 = 3'b000;
    #10;

    // SUB
    funct7 = 7'b0100000;
    funct3 = 3'b000;
    #10;

    // AND
    funct7 = 7'b0000000;
    funct3 = 3'b111;
    #10;

    // OR
    funct7 = 7'b0000000;
    funct3 = 3'b110;
    #10;

    // XOR
    funct7 = 7'b0000000;
    funct3 = 3'b100;
    #10;

    $finish;

end

endmodule