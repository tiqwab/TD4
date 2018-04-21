module IC74HC74(
    input CLK,
    input CLR_N,
    input D,
    output reg Q,
    output wire Q_
);

always @(posedge CLK or negedge CLR_N) begin
    if (~CLR_N)
        Q <= 1'b0;
    else
        Q <= D;
end

assign Q_ = ~Q;

endmodule
