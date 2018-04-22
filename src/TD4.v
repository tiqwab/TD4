module TD4(
    input CLK,
    input RST,
    input [3:0] SW, // IN
    output [6:0] HEX0, HEX1, HEX2, HEX3 // OUT
);

wire clr_n, en1hz;
wire [3:0] addr, out;
wire [7:0] data;

assign clr_n = ~RST;

// 1 Hz clock
CLK1HZ clk1hz(CLK, clr_n, en1hz);

// ROM
// LCHIKA_ROM(addr, clr_n, data);
RAMEN_ROM(addr, clr_n, data);

// CPU
TD4_BASE td4(en1hz, clr_n, SW, data, out, addr);

// decoders for HEXs
SEG2DEC dec_hex0(out[0], HEX0);
SEG2DEC dec_hex1(out[1], HEX1);
SEG2DEC dec_hex2(out[2], HEX2);
SEG2DEC dec_hex3(out[3], HEX3);

endmodule
