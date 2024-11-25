module Testbench;
    reg [4:0] E;          // Entradas E1-E5
    reg P;                // Bit de paridade
    wire [6:0] seg;       // Segmentos do display
    wire valid;           // Sinal de validade

    Display uut (
        .E(E), 
        .P(P), 
        .seg(seg), 
        .valid(valid)
    );

    initial begin
        // Teste 1: Paridade correta
        E = 5'b00001; P = 1'b0; #10; // Paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, valid, seg);

        // Teste 2: Paridade incorreta
        E = 5'b00001; P = 1'b1; #10; // Paridade incorreta (quantidade par de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, valid, seg);

        // Teste 3: Exibir caractere mapeado
        E = 5'b00010; P = 1'b0; #10; // Paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, valid, seg);

        // Teste 4: Entrada fora do intervalo
        E = 5'b10101; P = 1'b0; #10; // Paridade correta (quantidade ímpar de 1)
        $display("E: %b, P: %b, Valid: %b, Seg: %b", E, P, valid, seg);

        $finish;
    end
endmodule