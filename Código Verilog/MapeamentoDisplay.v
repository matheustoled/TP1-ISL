/*Este módulo usa as expressões booleanas fornecidas para ativar os segmentos apropriados.*/

module DisplayMapper(
    input [4:0] char,    // Código do caractere (E1-E5)
    input valid,         // Sinal de paridade
    output reg [6:0] seg // Segmentos do display: A-G
);
    always @(*) begin
        if (!valid) begin
            // Exibir "E" para erro de paridade
            seg = 7'b1010111;
        end else begin
            // Mapeamento dos caracteres
            case (char)
                5'b00000: seg = 7'b1011011;
                5'b00001: seg = 7'b1110111;
                5'b00010: seg = 7'b0110011;
                5'b00011: seg = 7'b1010100;
                5'b00100: seg = 7'b1111011;
                5'b00101: seg = 7'b0011100;
                5'b00110: seg = 7'b1111110;
                5'b00111: seg = 7'b1100111;
                5'b01000: seg = 7'b0110111;
                5'b01001: seg = 7'b0110000;
                5'b01010: seg = 7'b0111100;
                5'b01011: seg = 7'b1111011;
                5'b01100: seg = 7'b0110111;
                5'b01101: seg = 7'b1000111;
                5'b01110: seg = 7'b1110000;
                5'b01111: seg = 7'b0101010;
                5'b10000: seg = 7'b0001110;
                5'b10001: seg = 7'b1111001;
                5'b10010: seg = 7'b1001110;
                5'b10011: seg = 7'b0001111;
                
                default: seg = 7'b0000000; // Display apagado
            endcase
        end
    end
endmodule