module IC74HC153_sim(
);

reg [3:0] data;
reg [1:0] sel;
wire out;

IC74HC153 ic74hc153(data, sel, out);

initial begin
    $monitor("%t: %b, %b => %b", $time, data, sel, out);
end

initial begin
    data <= 4'b1010;
    sel <= 2'b00;
    #10
    sel <= 2'b01;
    #10
    sel <= 2'b10;
    #10
    sel <= 2'b11;
    #10
    data <= 4'b0101;
    sel <= 2'b00;
    #10
    sel <= 2'b01;
    #10
    sel <= 2'b10;
    #10
    sel <= 2'b11;
    #10
    $finish;
end

endmodule
