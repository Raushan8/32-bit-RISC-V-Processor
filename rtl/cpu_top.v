`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 16:44:34
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(

    input clk,
    input rst

);

wire [31:0] pc;
wire [31:0] pc_next;

assign pc_next = pc + 4;

pc PC(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc(pc)
);


wire [31:0] instruction;

instruction_memory IMEM(
    .pc(pc),
    .instruction(instruction)
);

wire [6:0] opcode;
wire [4:0] rd;
wire [4:0] rs1;
wire [4:0] rs2;
wire [2:0] funct3;
wire [6:0] funct7;

assign opcode = instruction[6:0];
assign rd     = instruction[11:7];
assign funct3 = instruction[14:12];
assign rs1    = instruction[19:15];
assign rs2    = instruction[24:20];
assign funct7 = instruction[31:25];

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;

control_unit CU(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc)
);

wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] write_data;

register_file RF(

    .clk(clk),
    .RegWrite(RegWrite),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .write_data(write_data),

    .read_data1(read_data1),
    .read_data2(read_data2)

);
wire [31:0] imm;

imm_gen IMM(

    .instruction(instruction),
    .imm(imm)

);
wire [31:0] alu_input2;

assign alu_input2 = (ALUSrc) ? imm : read_data2;


wire [2:0] alu_ctrl_r;
wire [2:0] ALU_Control;

alu_control ALUCTRL(

    .funct3(funct3),
    .funct7(funct7),
    .ALU_Control(alu_ctrl_r)

);

assign ALU_Control =
(opcode == 7'b0110011) ? alu_ctrl_r : 3'b000;

wire [31:0] ALU_Result;
wire Zero;

alu ALU(

    .A(read_data1),
    .B(alu_input2),
    .ALU_Control(ALU_Control),
    .Result(ALU_Result),
    .Zero(Zero)

);
wire [31:0] mem_read_data;

data_memory DM(

    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(ALU_Result),
    .write_data(read_data2),
    .read_data(mem_read_data)

);


assign write_data =
    (MemRead) ? mem_read_data : ALU_Result;

endmodule