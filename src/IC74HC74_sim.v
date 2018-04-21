module IC74HC74_sim(
);

reg clk, clr_n, d;
wire q, q_;

IC74HC74 ic74hc74(clk, clr_n, d, q, q_);

initial begin
    $monitor("%t: %b, %b, %b => %b, %b", $time, clk, clr_n, d, q, q_);
end

initial begin
    clk <= 1'b0;
    clr_n <= 1'b0;
    d <= 1'b0;
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    d <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b0;
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    d <= 1'b0;
    @(negedge clk)
    @(negedge clk)
    $finish;
end

always #10 begin
    clk <= ~clk;
end

endmodule
