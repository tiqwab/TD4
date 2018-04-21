module IC74HC161_C_sim(
);

reg clk, clr_n, load_n;
reg [3:0] in;
wire [3:0] out;
integer count;

IC74HC161_C ic64hc161_c(clk, clr_n, in, load_n, out);

initial begin
    $monitor("%t: %b, %b, %b => %b", $time, clr_n, in, load_n, out);
end

initial begin
    clk <= 1'b0;
    clr_n <= 1'b0;
    load_n <= 1'b0;
    in <= 4'b0;
    @(negedge clk)
    load_n <= 1'b1;
    clr_n <= 1'b1;
    for (count = 0; count < 20; count = count + 1) begin
        @(negedge clk);
    end
    in <= 4'b1010;
    load_n <= 1'b0;
    @(negedge clk)
    load_n <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b0;
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    $finish;
end

always #10 begin
    clk <= ~clk;
end

endmodule
