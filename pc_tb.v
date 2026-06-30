module pc_tb;

reg clk;
reg rst;
reg [31:0] pc_next;

wire [31:0] pc;

pc dut(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    pc_next = 0;

    $monitor($time,
             " rst=%b pc_next=%d pc=%d",
             rst, pc_next, pc);

    #10 rst = 0;

    pc_next = 4;
    #10;

    pc_next = 8;
    #10;

    pc_next = 12;
    #10;

    $finish;
end

endmodule