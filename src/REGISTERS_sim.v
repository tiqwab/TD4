module REGISTERS_sim(
);

reg clk, clr_n;
reg [3:0] load_n;
reg [1:0] select;
reg [3:0] in;
reg [3:0] immed;
wire [3:0] out, addr_rom;
wire carry_n;

REGISTERS registers(clk,
                    clr_n,
                    load_n,
                    select,
                    in,
                    immed,
                    out,
                    addr_rom,
                    carry_n);

initial begin
    $monitor("%t: %b, %b, %b, %b, %b => %b, %b, %b",
             $time, clr_n, load_n, select, in, immed,
             out, addr_rom, carry_n);
end

initial begin
    clk <= 1'b0;
    clr_n <= 1'b0;
    load_n <= 4'b1111;
    select <= 2'b0;
    in <= 4'b0;
    immed <= 4'b0;
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    // Load 4'b0101 to register A
    in <= 4'b0101;
    select <= 2'b10;
    load_n <= 4'b1110;
    @(negedge clk)
    // Transfer register A to register C
    in <= 4'b0;
    select <= 2'b00;
    load_n <= 4'b1011;
    @(negedge clk)
    // Load 4'b1010 to register B
    in <= 4'b1010;
    select <= 2'b10;
    load_n <= 4'b1101;
    @(negedge clk)
    // Transfer register B to register D
    in <= 4'b0;
    select <= 2'b01;
    load_n <= 4'b0111;
    @(negedge clk)
    // Add register B and immediate 0110 (and carry over)
    immed <= 4'b0110;
    select <= 2'b01;
    load_n <= 4'b1011;
    @(negedge clk)
    immed <= 4'b0;
    select <= 2'b00;
    load_n <= 4'b1111;
    @(negedge clk)
    @(negedge clk)
    $finish;
end

always #10 begin
    clk <= ~clk;
end

endmodule
