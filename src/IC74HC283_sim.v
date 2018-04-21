module IC74HC283_sim(
);

reg [3:0] a, b;
reg c_in;
wire [3:0] s;
wire c_out;

IC74HC283 ic74hc283(a, b, c_in, s, c_out);

initial begin
    $monitor("%t: %b, %b, %b => %b, %b", $time, a, b, c_in, s, c_out);
end

initial begin
    a <= 4'b0;
    b <= 4'b0;
    c_in <= 1'b0;
    #10
    a <= 4'b0001;
    b <= 4'b0011;
    c_in <= 1'b0;
    #10
    a <= 4'b0111;
    b <= 4'b0011;
    c_in <= 1'b1;
    #10
    a <= 4'b1111;
    b <= 4'b1111;
    c_in <= 1'b1;
    #10
    a <= 4'b0;
    b <= 4'b0;
    c_in <= 1'b0;
    #10
    $finish;
end

endmodule
