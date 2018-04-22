module RAMEN_ROM(
    input [3:0] ADDR,
    input CLR_N,
    output wire [7:0] DATA
);

reg [7:0] romdata [15:0];

always @(negedge CLR_N) begin
    if (~CLR_N) begin
        romdata[0]  <= 8'b1011_0111; // OUT 0111
        romdata[1]  <= 8'b0000_0001; // ADD A, 0001
        romdata[2]  <= 8'b1110_0001; // JNC 0001
        romdata[3]  <= 8'b0000_0001; // ADD A, 0001
        romdata[4]  <= 8'b1110_0011; // JNC 0011
        romdata[5]  <= 8'b1011_0110; // OUT 0110
        romdata[6]  <= 8'b0000_0001; // ADD A, 0001
        romdata[7]  <= 8'b1110_0110; // JNC 0110
        romdata[8]  <= 8'b0000_0001; // ADD A, 0001
        romdata[9]  <= 8'b1110_1000; // JNC 1000
        romdata[10] <= 8'b1011_0000; // OUT 0000
        romdata[11] <= 8'b1011_0100; // OUT 0100
        romdata[12] <= 8'b0000_0001; // ADD A, 0001
        romdata[13] <= 8'b1110_1010; // JNC 1010
        romdata[14] <= 8'b1011_1000; // OUT 1000
        romdata[15] <= 8'b1111_1111; // JMP 1111
    end
end

assign DATA = romdata[ADDR];

endmodule
