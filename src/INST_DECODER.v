module INST_DECODER(
    input [3:0] OP,
    input CARRY_N,
    output wire [3:0] LOAD_N,
    output wire [1:0] SELECT
);

wire op2_ld2, op0_ld3;

assign SELECT[1] = OP[1];
IC74HC32 two_or_1(OP[0], OP[3], SELECT[0]);
IC74HC32 two_or_2(OP[2], OP[3], LOAD_N[0]);
IC74HC10 three_and_1({1'b1}, {1'b1}, OP[2], op2_ld2);
IC74HC32 two_or_3(op2_ld2, OP[3], LOAD_N[1]);
IC74HC10 three_and_2({1'b1}, op2_ld2, OP[3], LOAD_N[2]);
IC74HC32 two_or_4(OP[0], CARRY_N, op0_ld3);
IC74HC10 three_and_3(OP[2], OP[3], op0_ld3, LOAD_N[3]);

endmodule
