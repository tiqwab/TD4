module CLK1HZ(
    input CLK,
    input CLR_N,
    output reg EN1HZ
);

parameter CLK_HZ = 50_000_000;

reg [25:0] cnt;

always @(posedge CLK or negedge CLR_N) begin
    if (~CLR_N)
        cnt <= 26'b0;
    else if (cnt == CLK_HZ - 1)
        cnt <= 26'b0;
    else
        cnt <= cnt + 26'b1;
end

always @(posedge CLK or negedge CLR_N) begin
    if (~CLR_N)
        EN1HZ <= 1'b0;
    else if (cnt == (CLK_HZ / 2) - 1)
        EN1HZ <= 1'b1;
    else if (cnt == CLK_HZ - 1)
        EN1HZ <= 1'b0;
end

endmodule
