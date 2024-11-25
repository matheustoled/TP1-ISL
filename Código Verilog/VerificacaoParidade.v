/*Este módulo calcula a paridade ímpar dos 5 primeiros bits e verifica se o bit de paridade está correto.*/

module ParityChecker(
    input [4:0] E,    // Entradas E1-E5
    input P,          // Bit de paridade
    output reg valid  // Sinal de validade: 1 se a paridade estiver correta, 0 caso contrário
);
    always @(*) begin
        // Verifica se o total de '1's nos bits (E + P) é ímpar
        valid = (^E ^ P) == 1'b1;
    end
endmodule