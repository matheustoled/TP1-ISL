/*Este módulo usa as expressões booleanas fornecidas para ativar os segmentos apropriados.*/

module MapeamentoDisplay(
    input [4:0] char,       //código do caractere (E1-E5)
    input validade,         //sinal de paridade
    output reg [6:0] seg    //segmentos do display: A-G
);
    always @(*) begin
        if (!validade) begin
            //caractere erro de paridade
            seg = 7'b0101000;
        end else begin
            //mapeamento dos caracteres
            case (char)
                5'b00000: seg = 7'b0100100;
                5'b00001: seg = 7'b0001000;
                5'b00010: seg = 7'b1001100;
                5'b00011: seg = 7'b0101011;
                5'b00100: seg = 7'b0000100;
                5'b00101: seg = 7'b1100011;
                5'b00110: seg = 7'b0000001;
                5'b00111: seg = 7'b0011000;
                5'b01000: seg = 7'b1001000;
                5'b01001: seg = 7'b1001111;
                5'b01010: seg = 7'b1000011;
                5'b01011: seg = 7'b0000100;
                5'b01100: seg = 7'b1001000;
                5'b01101: seg = 7'b0111000;
                5'b01110: seg = 7'b0001111;
                5'b01111: seg = 7'b1010101;
                5'b10000: seg = 7'b1110001;
                5'b10001: seg = 7'b0000110;
                5'b10010: seg = 7'b0110001;
                5'b10011: seg = 7'b1110000;
                
                default: seg = 7'b1111111; //display apagado
            endcase
        end
    end
endmodule