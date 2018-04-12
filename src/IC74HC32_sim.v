module IC74HC32_sim(
);

reg in1, in2;
wire out;

IC74HC32 ic74hc32(in1, in2, out);

initial begin
    $monitor("%t: %b + %b => %b", $time, in1, in2, out);
end

initial begin
    #10
    in1 <= 1'b0;
    in2 <= 1'b0;
    #10
    in1 <= 1'b1;
    in2 <= 1'b0;
    #10
    in1 <= 1'b0;
    in2 <= 1'b1;
    #10
    in1 <= 1'b1;
    in2 <= 1'b1;
    #10
    in1 <= 1'b0;
    in2 <= 1'b0;
    #10
    $finish;
end

endmodule
