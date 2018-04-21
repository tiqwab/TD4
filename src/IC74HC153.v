module IC74HC153(
    input [3:0] IN,
    input [1:0] SEL,
    output wire OUT
);

function selector_4bit(
    input [3:0] data,
    input [1:0] sel
);

case(sel)
    2'b00: selector_4bit = data[0];
    2'b01: selector_4bit = data[1];
    2'b10: selector_4bit = data[2];
    2'b11: selector_4bit = data[3];
endcase

endfunction

assign OUT = selector_4bit(IN, SEL);

endmodule
