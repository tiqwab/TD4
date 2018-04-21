module IC74HC283(
    input [3:0] A,
    input [3:0] B,
    input C_IN,
    output wire [3:0] S,
    output wire C_OUT
);

wire [4:0] calc;

assign calc = A + B + C_IN;
assign S = calc[3:0];
assign C_OUT = calc[4:4];

endmodule
