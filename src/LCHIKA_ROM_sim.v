module LCHIKA_ROM_sim(
);

reg [3:0] addr;
reg clr_n;
wire [7:0] data;

LCHIKA_ROM lchika(addr, clr_n, data);

initial begin
    $monitor("%t: %b, %b => %b", $time, addr, clr_n, data);
end

initial begin
    addr <= 4'b0;
    clr_n <= 1'b0;
    #10
    clr_n <= 1'b1;
    #10
    addr <= 4'b0001;
    #10
    addr <= 4'b0010;
    #10
    clr_n <= 1'b0;
    #10
    $finish;
end

endmodule
