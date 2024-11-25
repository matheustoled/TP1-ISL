/*Combina o verificador de paridade e o mapeador de display.*/

module Display(
    input [4:0] E,       // Entradas E1-E5
    input P,             // Bit de paridade
    output [6:0] seg,    // Segmentos do display: A-G
    output valid         // Validade da paridade
);
    wire internal_valid; // Sinal interno para conectar os módulos

    ParityChecker checker (
        .E(E), 
        .P(P), 
        .valid(internal_valid)
    );

    DisplayMapper mapper (
        .char(E), 
        .valid(internal_valid), 
        .seg(seg)
    );

    assign valid = internal_valid; // Passa o sinal de validade para fora do módulo
endmodule