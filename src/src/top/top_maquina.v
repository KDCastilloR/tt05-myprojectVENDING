module top_maquina (
    input wire clk,
    input wire reset,
    input wire [1:0] moneda,
    input wire comprarA,
    input wire comprarB,
    output wire listoA,
    output wire listoB,
    output wire [3:0] total,
    output wire [3:0] cambio
);

    wire vendA, vendB;

    moore_fsm moore_inst (
        .clk(clk),
        .reset(reset),
        .moneda(moneda),
        .comprarA(comprarA),
        .comprarB(comprarB),
        .listoA(listoA),
        .listoB(listoB),
        .total(total),
        .vendA(vendA),
        .vendB(vendB)
    );

    mealy_fsm mealy_inst (
        .clk(clk),
        .reset(reset),
        .total(total),
        .vendA(vendA),
        .vendB(vendB),
        .cambio(cambio)
    );

endmodule
