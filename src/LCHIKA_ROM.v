module LCHIKA_ROM(
    input [3:0] ADDR,
    input CLR_N,
    output wire [7:0] DATA
);

reg [7:0] romdata [15:0];

always @(negedge CLR_N) begin
    if (~CLR_N) begin
        romdata[0]  <= 8'b1011_0011;
        romdata[1]  <= 8'b1011_0110;
        romdata[2]  <= 8'b1011_1100;
        romdata[3]  <= 8'b1011_1000;
        romdata[4]  <= 8'b1011_1000;
        romdata[5]  <= 8'b1011_1100;
        romdata[6]  <= 8'b1011_0110;
        romdata[7]  <= 8'b1011_0011;
        romdata[8]  <= 8'b1011_0001;
        romdata[9]  <= 8'b1111_0000;
        romdata[10] <= 8'b0;
        romdata[11] <= 8'b0;
        romdata[12] <= 8'b0;
        romdata[13] <= 8'b0;
        romdata[14] <= 8'b0;
        romdata[15] <= 8'b0;
    end
end

assign DATA = romdata[ADDR];

endmodule
