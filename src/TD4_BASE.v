module TD4_BASE(
    input CLK,
    input CLR_N,
    input [3:0] IN,
    input [7:0] DATA_ROM,
    output wire [3:0] OUT,
    output wire [3:0] ADDR_ROM
);

wire [3:0] load_n;
wire [1:0] select;
wire carry_n;

REGISTERS registers(CLK,
                    CLR_N,
                    load_n,
                    select,
                    IN,
                    DATA_ROM[3:0],
                    OUT,
                    ADDR_ROM,
                    carry_n);

INST_DECODER inst_decoder(DATA_ROM[7:4],
                         carry_n,
                         load_n,
                         select);

endmodule
