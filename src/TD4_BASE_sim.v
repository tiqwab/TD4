module TD4_BASE_sim(
);

reg clk, clr_n;
reg [3:0] in;
reg [7:0] data_rom;
wire [3:0] out, addr_rom;

TD4_BASE td4_base(clk, clr_n, in, data_rom, out, addr_rom);

initial begin
    $monitor("%t: %b, %b, %b => %b, %b",
             $time, clr_n, in, data_rom, out, addr_rom);
end

initial begin
    clk <= 1'b0;
    clr_n <= 1'b0;
    in <= 4'b0;
    data_rom <= 8'b0;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    // IN A
    in <= 4'b1010;
    data_rom <= 8'b00100000;
    @(negedge clk)
    // ADD A, Im
    data_rom <= 8'b00000010;
    @(negedge clk)
    // MOV B, A
    data_rom <= 8'b01000000;
    @(negedge clk)
    // OUT B (output should be 4'b1100)
    data_rom <= 8'b10010000;
    @(negedge clk)
    clr_n <= 1'b0;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    // IN B
    in <= 4'b0101;
    data_rom <= 8'b01100000;
    @(negedge clk)
    // MOV A, B
    data_rom <= 8'b00010000;
    @(negedge clk)
    // MOV B, Im
    data_rom <= 8'b01111000;
    @(negedge clk)
    // ADD B, Im
    data_rom <= 8'b01010010;
    @(negedge clk)
    // OUT B (output should be 4'b1010)
    data_rom <= 8'b10010000;
    @(negedge clk)
    // MOV B, A
    data_rom <= 8'b01000000;
    @(negedge clk)
    // OUT B (output should be 4'b0101)
    data_rom <= 8'b10010000;
    @(negedge clk)
    clr_n <= 1'b0;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    // MOV A, Im
    data_rom <= 8'b00110011;
    @(negedge clk)
    // JNC Im
    data_rom <= 8'b11101000;
    @(negedge clk)
    // ADD A, Im
    data_rom <= 8'b00001101;
    @(negedge clk)
    // JNC Im
    data_rom <= 8'b11101000;
    @(negedge clk)
    // JMP Im
    data_rom <= 8'b11110100;
    @(negedge clk)
    // OUT Im
    data_rom <= 8'b10110001;
    @(negedge clk)
    clr_n <= 1'b1;
    @(negedge clk)
    $finish;
end

always #10 begin
    clk <= ~clk;
end

endmodule
