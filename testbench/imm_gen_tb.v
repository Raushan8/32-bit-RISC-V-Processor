`timescale 1ns / 1ps

module imm_gen_tb;

    reg  [31:0] instruction;
    wire [31:0] imm;

    imm_gen DUT (
        .instruction(instruction),
        .imm(imm)
    );

    integer pass = 0;
    integer fail = 0;

    task check;
        input [31:0] expected;
        input [8*20:1] test_name;
        begin
            #5;
            if (imm === expected) begin
                $display("PASS | %-22s | instr=0x%08h | imm=%0d (0x%08h)", test_name, instruction, $signed(imm), imm);
                pass = pass + 1;
            end else begin
                $display("FAIL | %-22s | instr=0x%08h | got=0x%08h | exp=0x%08h", test_name, instruction, imm, expected);
                fail = fail + 1;
            end
        end
    endtask

    initial begin
        $display("=======================================================");
        $display("          Immediate Generator Testbench                 ");
        $display("=======================================================");

        //------------------------------------------------------------
        // I-TYPE  (opcode 0010011 = ADDI, 0000011 = LW, 1100111 = JALR)
        //------------------------------------------------------------
        // ADDI x1, x0, 5  → imm = +5
        instruction = 32'h00500093;   // standard encoding
        check(32'd5,             "I ADDI imm=+5");

        // ADDI x1, x0, -1 → imm = -1
        instruction = 32'hfff00093;
        check(32'hFFFFFFFF,      "I ADDI imm=-1");

        // ADDI x1, x0, -2048 → imm = -2048 (most negative)
        instruction = 32'h80000093;
        check(32'hFFFFF800,      "I ADDI imm=-2048");

        // LW x1, 12(x2) → imm = +12
        instruction = 32'h00c12083;
        check(32'd12,            "I LW imm=+12");

        //------------------------------------------------------------
        // S-TYPE  (opcode 0100011 = SW)
        //------------------------------------------------------------
        // SW x2, 8(x1)  → imm = +8
        // imm[11:5]=0000000  imm[4:0]=01000
        instruction = 32'b0000000_00010_00001_010_01000_0100011;
        check(32'd8,             "S SW imm=+8");

        // SW x2, -4(x1) → imm = -4
        // imm[11:5]=1111111  imm[4:0]=11100
        instruction = 32'b1111111_00010_00001_010_11100_0100011;
        check(32'hFFFFFFFC,      "S SW imm=-4");

        //------------------------------------------------------------
        // B-TYPE  (opcode 1100011 = BEQ/BNE/BLT/BGE)
        // Encoding:  [31]=imm[12] [30:25]=imm[10:5] [11:8]=imm[4:1] [7]=imm[11]
        //------------------------------------------------------------
        // BEQ x1,x2, +8  → imm = 8
        // imm=8 → bit pattern: 12=0,11=0,10:5=000000,4:1=0100,0=0
        // instr[31]=0 instr[7]=0 instr[30:25]=000000 instr[11:8]=0100
        instruction = 32'b0_000000_00010_00001_000_0100_0_1100011;
        check(32'd8,             "B BEQ offset=+8");

        // BEQ x1,x2, -4 → imm = -4 = 0xFFFFFFFC
        // imm=-4 → 21-bit: 1_1_111111_1110_0
        // 12=1,11=1,10:5=111111,4:1=1110,0=0
        // instr[31]=1 instr[7]=1 instr[30:25]=111111 instr[11:8]=1110
        instruction = 32'b1_111111_00010_00001_000_1110_1_1100011;
        check(32'hFFFFFFFC,      "B BEQ offset=-4");

        //------------------------------------------------------------
        // U-TYPE  (opcode 0110111 = LUI, 0010111 = AUIPC)
        //------------------------------------------------------------
        // LUI x1, 0x12345 → imm = 0x12345000
        instruction = 32'h123450b7;
        check(32'h12345000,      "U LUI imm=0x12345000");

        // LUI x1, 0xFFFFF → imm = 0xFFFFF000
        instruction = 32'hfffff0b7;
        check(32'hFFFFF000,      "U LUI imm=0xFFFFF000");

        //------------------------------------------------------------
        // J-TYPE  (opcode 1101111 = JAL)
        // Encoding: [31]=imm[20] [30:21]=imm[10:1] [20]=imm[11] [19:12]=imm[19:12]
        //------------------------------------------------------------
        // JAL x1, +4 → imm = 4
        // imm=4: 20=0,19:12=00000000,11=0,10:1=0000000010
        // instr[31]=0 instr[19:12]=00000000 instr[20]=0 instr[30:21]=0000000010
        instruction = 32'b0_0000000010_0_00000000_00001_1101111;
        check(32'd4,             "J JAL offset=+4");

        // JAL x0, -8 → imm = -8 = 0xFFFFFFF8
        // imm=-8: 21-bit = 1_11111111_1_11111111_000
        // 20=1,19:12=11111111,11=1,10:1=1111111100
        // instr[31]=1 instr[19:12]=11111111 instr[20]=1 instr[30:21]=1111111100
        instruction = 32'b1_1111111100_1_11111111_00000_1101111;
        check(32'hFFFFFFF8,      "J JAL offset=-8");

        //------------------------------------------------------------
        // Default: unknown opcode → imm = 0
        //------------------------------------------------------------
        instruction = 32'b000000000000_00000_000_00000_0001111; // FENCE opcode
        check(32'd0,             "Default unknown op");

        //------------------------------------------------------------
        // Summary
        //------------------------------------------------------------
        $display("=======================================================");
        $display("  Results: %0d PASSED, %0d FAILED out of %0d tests", pass, fail, pass+fail);
        $display("=======================================================");
        $finish;
    end

endmodule
