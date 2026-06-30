module alu(

    input  [31:0] A,
    input  [31:0] B,
    input  [2:0] ALU_Control,

    output reg [31:0] Result,
    output Zero

);

always @(*) begin

    case(ALU_Control)

        3'b000: Result = A + B;
        3'b001: Result = A - B;
        3'b010: Result = A & B;
        3'b011: Result = A | B;
        3'b100: Result = A ^ B;

        default: Result = 32'd0;

    endcase

end

assign Zero = (Result == 32'd0);

endmodule