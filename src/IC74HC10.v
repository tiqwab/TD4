module IC74HC10(
    input A,
    input B,
    input C,
    output wire Y
);

assign Y = ~(A & B & C);

endmodule
