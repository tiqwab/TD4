module SEG2DEC(
    input IN,
    output wire [6:0] HEX
);

assign HEX = decoder(IN);

function [6:0] decoder(
    input x
);

case (x)
    1'b0   : decoder = 7'b1000000;
    1'b1   : decoder = 7'b1111001;
    default: decoder = 7'bxxxxxxx;
endcase

endfunction

endmodule
