/*Combina o verificador de paridade e o mapeador de display.*/

module Display(
    input [4:0] E,       //entradas E1-E5
    input P,             //bit de paridade
    output [6:0] seg,    //segmentos do display: A-G
    output validade      //validade da paridade
);
    wire internal_validade; //sinal interno para conectar os módulos

    VerificacaoParidade checker (
        .E(E), 
        .P(P), 
        .validade(internal_validade)
    );

    MapeamentoDisplay mapper (
        .char(E), 
        .validade(internal_validade), 
        .seg(seg)
    );

    assign validade = internal_validade; //passa o sinal de validade para fora do módulo
endmodule