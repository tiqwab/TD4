module IC74HC161_L(
    input CLK,
    input CLR_N,
    input [3:0] IN,
    input LOAD_N,
    output reg [3:0] OUT
);

always @(posedge CLK or negedge CLR_N) begin
    if (~CLR_N)
        OUT <= 4'b0;
    else if (~LOAD_N)
        OUT <= IN;
end

endmodule
