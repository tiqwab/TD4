module INST_DECODER_sim(
);

reg [3:0] op;
reg carry_n;
wire [3:0] load_n;
wire [1:0] select;

INST_DECODER inst_decoder(op,
                          carry_n,
                          load_n,
                          select);

initial begin
    $monitor("%t: %b, %b => %b, %b", $time, op, carry_n, load_n, select);
end

initial begin
    // ADD A, Im
    op <= 4'b0;
    carry_n <= 1'bx;
    #10
    // MOV A, B
    op <= 4'b0001;
    #10
    // IN A
    op <= 4'b0010;
    #10
    // MOV A, Im
    op <= 4'b0011;
    #10
    // MOV B, A
    op <= 4'b0100;
    #10
    // ADD B, Im
    op <= 4'b0101;
    #10
    // IN B
    op <= 4'b0110;
    #10
    // MOV B, Im
    op <= 4'b0111;
    #10
    // OUT B
    op <= 4'b1001;
    #10
    // OUT Im
    op <= 4'b1011;
    #10
    // JNC(C=0)
    op <= 4'b1110;
    carry_n <= 1'b0;
    #10
    // JNC(C=1)
    carry_n <= 1'b1;
    #10
    // JMP
    op <= 4'b1111;
    carry_n <= 1'bx;
    #10
    $finish;
end

endmodule
