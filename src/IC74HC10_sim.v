module IC74HC10_sim(
);

reg in1, in2, in3;
wire out;

IC74HC10 ic74hc10(in1, in2, in3, out);

initial begin
    $monitor("%t: %b, %b, %b => %b", $time, in1, in2, in3, out);
end

initial begin
    #10
    in1 <= 1'b0;
    in2 <= 1'b0;
    in3 <= 1'b0;
    #10
    in1 <= 1'b0;
    in2 <= 1'b0;
    in3 <= 1'b1;
    #10
    in1 <= 1'b0;
    in2 <= 1'b1;
    in3 <= 1'b0;
    #10
    in1 <= 1'b0;
    in2 <= 1'b1;
    in3 <= 1'b1;
    #10
    in1 <= 1'b1;
    in2 <= 1'b0;
    in3 <= 1'b0;
    #10
    in1 <= 1'b1;
    in2 <= 1'b0;
    in3 <= 1'b1;
    #10
    in1 <= 1'b1;
    in2 <= 1'b1;
    in3 <= 1'b0;
    #10
    in1 <= 1'b1;
    in2 <= 1'b1;
    in3 <= 1'b1;
    #10
    in1 <= 1'b0;
    in2 <= 1'b0;
    in3 <= 1'b0;
    #10
    $finish;
end

endmodule
