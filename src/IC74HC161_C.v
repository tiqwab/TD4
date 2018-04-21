module IC74HC161_C(
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
    else
        if (OUT == 4'b1111)
            OUT <= 4'b0;
        else
            OUT <= OUT + 4'b1;
end

endmodule
