module CLK1HZ_sim(
);

reg clk, clr_n;
wire en1hz;
integer cnt;

CLK1HZ #(4) clk1hz(clk, clr_n, en1hz);

initial begin
    $monitor("%t: %b, %b => %b", $time, clk, clr_n, en1hz);
end

initial begin
    clk <= 1'b0;
    clr_n <= 1'b0;
    @(negedge clk)
    clr_n <= 1'b1;
    for (cnt = 0; cnt < 20; cnt = cnt + 1) begin
        @(negedge clk);
    end
    clr_n <= 1'b0;
    @(negedge clk)
    $finish;
end

always #10 begin
    clk <= ~clk;
end

endmodule
