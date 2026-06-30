module control_unit(
    input [6:0] opcode,

    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc
);

always @(*) begin

    case(opcode)

        7'b0110011: begin // ADD
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            ALUSrc   = 0;
        end

        7'b0000011: begin // LW
            RegWrite = 1;
            MemRead  = 1;
            MemWrite = 0;
            ALUSrc   = 1;
        end

        7'b0100011: begin // SW
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 1;
            ALUSrc   = 1;
        end

        7'b0010011: begin // ADDI
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            ALUSrc   = 1;
        end

        default: begin
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            ALUSrc   = 0;
        end

    endcase

end

endmodule
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    