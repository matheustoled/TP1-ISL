/*Testbench.*/

module Testbench;
    reg [4:0] E;          //entradas E1-E5
    reg P;                //bit de paridade
    wire [6:0] seg;       //segmentos do display
    wire validade;        //sinal de validade

    Display uut (
        .E(E), 
        .P(P), 
        .seg(seg), 
        .validade(validade)
    );

    //comandos para gerar o arquivo VCD
    initial begin
        $dumpfile("simulacao_ondas.vcd");
        $dumpvars(0, Testbench); //grava todas as variáveis do módulo Testbench
    end

    initial begin //Testes
        // Teste 1:paridade correta
        E = 5'b00001; P = 1'b0; #10; //paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, validade, seg);

        // Teste 2:paridade incorreta
        E = 5'b00001; P = 1'b1; #10; //paridade incorreta (quantidade par de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, validade, seg);

        // Teste 3: Exibir caractere mapeado
        E = 5'b00010; P = 1'b0; #10; //paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, validade, seg);

        // Teste 4: Entrada fora do intervalo
        E = 5'b10101; P = 1'b0; #10; //paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, validade, seg);

        $finish;
    end
endmodule