compile: Display.v VerificacaoParidade.v MapeamentoDisplay.v Display_tb.v
	iverilog -o sim Display.v VerificacaoParidade.v MapeamentoDisplay.v Display_tb.v && vvp sim && gtkwave simulacao_ondas.vcd