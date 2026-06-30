module register_file_tb;

reg clk;
reg RegWrite;

reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;

reg [31:0] write_data;

wire [31:0] read_data1;
wire [31:0] read_data2;

register_file dut(
    .clk(clk),
    .RegWrite(RegWrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    RegWrite = 0;

    $monitor(
        "t=%0t rs1=%d rs2=%d rd=%d write_data=%d read_data1=%d read_data2=%d",
        $time, rs1, rs2, rd, write_data, read_data1, read_data2
    );

    // Write 100 into x1
    RegWrite = 1;
    rd = 5'd1;
    write_data = 32'd100;
    #10;

    // Write 200 into x2
    rd = 5'd2;
    write_data = 32'd200;
    #10;

    // Read x1 and x2
    RegWrite = 0;
    rs1 = 5'd1;
    rs2 = 5'd2;
    #10;

    // Try to write 999 into x0
    RegWrite = 1;
    rd = 5'd0;
    write_data = 32'd999;
    #10;

    // Read x0
    RegWrite = 0;
    rs1 = 5'd0;
    rs2 = 5'd1;
    #10;

    $finish;

end

endmodule