module REGISTERS(
    input CLK,
    input CLR_N,
    input [3:0] LOAD_N,
    input [1:0] SELECT,
    input [3:0] IN,
    input [3:0] IMMED,
    output wire [3:0] OUT,
    output wire [3:0] ADDR_ROM,
    output wire CARRY_N
);

wire [3:0] data, register_in, selector_out;
wire [3:0] reg_out_A, reg_out_B;

// Selectors
IC74HC153 sel_0({1'b0, IN[0], reg_out_B[0], reg_out_A[0]},
                SELECT,
                selector_out[0]);
IC74HC153 sel_1({1'b0, IN[1], reg_out_B[1], reg_out_A[1]},
                SELECT,
                selector_out[1]);
IC74HC153 sel_2({1'b0, IN[2], reg_out_B[2], reg_out_A[2]},
                SELECT,
                selector_out[2]);
IC74HC153 sel_3({1'b0, IN[3], reg_out_B[3], reg_out_A[3]},
                SELECT,
                selector_out[3]);

// Registers
IC74HC161_L reg_A(CLK, CLR_N, register_in, LOAD_N[0], reg_out_A);
IC74HC161_L reg_B(CLK, CLR_N, register_in, LOAD_N[1], reg_out_B);
IC74HC161_L reg_C(CLK, CLR_N, register_in, LOAD_N[2], OUT);
IC74HC161_C reg_D(CLK, CLR_N, register_in, LOAD_N[3], ADDR_ROM);

wire carry, q;

// ALU
IC74HC283 alu(selector_out, IMMED, {1'b0}, register_in, carry);

// Register for carry_n
IC74HC74 carry_reg(CLK, CLR_N, carry, q, CARRY_N);

endmodule
