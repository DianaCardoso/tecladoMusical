COD SEGMENT

ASSUME CS:COD, DS:COD, ES:COD, SS:COD

ORG 100h

MAIN PROC NEAR
	
	MOV AH, 00h
	MOV AL, 04h
	INT 10h
	
		
	LEA DX, msgInicial_0		;ImprimeString msgInicial_0
	CALL ImprimeString2
	
	LEA DX, msgInicial2			;ImprimeString msgInicial2
	CALL ImprimeString2
	
	LEA DX, msgInicial2_1		;ImprimeString msgInicial2_1
	CALL ImprimeString2
	
	LEA DX, msgInicial3			;ImprimeString msgInicial3
	CALL ImprimeString2
	
	
	Ler_Char:
	
		MOV AH, 8  			 ;Le e nao mostra na tela
		INT 21h
		
		CMP AL, 'a'			;Irão ler a tecla apertada e vão comparar para tocar o som respectivo a letra
		JNE	Continua_1
		MOV AH, 11
		MOV BH, 09
		MOV BL, 0Fh			;Muda cor da letra
		INT 10h
	
		LEA DX, MC
		CALL ImprimeString2
		JMP Nota_C2
		
		Continua_1:
		CMP AL, 'w'
		JNE Continua_2
		MOV AH, 11
		MOV BH, 09
		MOV BL, 1			;Muda cor da letra
		INT 10h
		LEA DX, MCs
		CALL ImprimeString2
		JMP Nota_C2s
		
		Continua_2:
		CMP AL, 's'
		JNE Continua_3
		MOV AH, 11
		MOV BH, 09
		MOV BL, 2			;Muda cor da letra
		INT 10h
	
		LEA DX, MD
		CALL ImprimeString2			
		JMP Nota_D2
		
		Continua_3:
		CMP AL, 'e'
		JNE Continua_4
		MOV AH, 11
		MOV BH, 09
		MOV BL, 3			;Muda cor da letra
		INT 10h
		LEA DX, MDs
		CALL ImprimeString2
		JMP Nota_D2s
		
		Continua_4:
		CMP AL, 'd'
		JNE Continua_5
		MOV AH, 11
		MOV BH, 09
		MOV BL, 4			;Muda cor da letra
		INT 10h
		
		LEA DX, ME
		CALL ImprimeString2
		JMP Nota_E2
		
		Continua_5:
		CMP AL, 'f'
		JNE Continua_6
		MOV AH, 11
		MOV BH, 09
		MOV BL, 5			;Muda cor da letra
		INT 10h
				
		LEA DX, MF
		CALL ImprimeString2		
		JMP Nota_F2
		
		Continua_6:
		CMP AL, 't'
		JNE Continua_7
		MOV AH, 11
		MOV BH, 09
		MOV BL, 6			;Muda cor da letra
		INT 10h
		LEA DX, MF
		CALL ImprimeString2	
		JMP Nota_F2s
		
		Continua_7:
		CMP AL, 'g'
		JNE Continua_8
		MOV AH, 11
		MOV BH, 09
		MOV BL, 7			;Muda cor da letra
		INT 10h
		
		LEA DX, MG
		CALL ImprimeString2	
		JMP Nota_G2
		
		Continua_8:
		CMP AL, 'y'
		JNE Continua_9
		MOV AH, 11
		MOV BH, 09
		MOV BL, 6			;Muda cor da letra
		INT 10h
		LEA DX, MGs
		CALL ImprimeString2	
		JMP Nota_G2s
		
		Continua_9:
		CMP AL, 'h'
		JNE Continua_10
		MOV AH, 11
		MOV BH, 09
		MOV BL, 5			;Muda cor da letra
		INT 10h
		
		LEA DX, MA
		CALL ImprimeString2	
		JMP Nota_A2
		
		Continua_10:
		CMP AL, 'u'
		JNE Continua_11
		MOV AH, 11
		MOV BH, 09
		MOV BL, 4			;Muda cor da letra
		INT 10h
		LEA DX, MAs
		CALL ImprimeString2	
		JMP Nota_A2s
		
		Continua_11:
		CMP AL, 'j'
		JNE Continua_12
		MOV AH, 11
		MOV BH, 09
		MOV BL, 3			;Muda cor da letra
		INT 10h
		
		LEA DX, MB
		CALL ImprimeString2	
		JMP Nota_B2
		
		Continua_12:
		CMP AL, 'k'
		JNE Continua_fim
		MOV AH, 11
		MOV BH, 09
		MOV BL, 2			;Muda cor da letra
		INT 10h
	
		LEA DX, MC2
		CALL ImprimeString2	
		JMP Nota_C3
		
		Continua_fim:
		CMP AL, 'q'
		JNE Ler_Char2
		JMP Fim
		
		Ler_Char2:
		JMP Ler_Char

	JMP Fim
	
	Nota_C0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV	AX, 9121 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_C0s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 8609 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_D0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 8126 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_D0s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 7670 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_E0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 7239 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 6833 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F0s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 6449 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_G0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 6087 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_G0s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 5746 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_A0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 5423 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_A0s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 5119 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_B0:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 4831 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_C1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 4560 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_C1s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 4304 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_D1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 4063 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_D1s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 3834 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_E1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 3619 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 3416 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F1s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 3224 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_G1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 3043 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_G1s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2873 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_A1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2711 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_A1s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2559 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_B1:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2415 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_C2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2280 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_C2s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2152 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_D2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 2031 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_D2s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1917 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_E2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1809 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1715 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_F2s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1612 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_G2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1521		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_G2s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1436 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_A2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1355 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_A2s:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1292 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
		
	Nota_B2:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1207 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Nota_C3:
	
		MOV AL, 182
		OUT 43h, AL 		;prepara a nota
		MOV AX, 1140 		;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		CALL Procss
			
		JMP Ler_Char
	
	Procss:	
	
		DURA_1:
		
			MOV CX, 0FFFFh
			
		DURAC_1:
		
			DEC CX
			JNE durac_1
			DEC BX 
			JNE dura_1
				
			IN AL, 61h 				;verifica qual o valor está na porta 61h
			AND AL, 11111100b 		;zera os 2 bts - significativo
			OUT 61h, AL			 	;atualiza 61h fim reproducao
		RET
		
	
	ImprimeString2:
	
		MOV AH, 09h
		INT 21h
		RET	
		
	Silencio:
		
		MOV AL, 182
		OUT 43h, AL			;prepara a nota
		MOV AX, 20 			;do central do piano (decimal)   20 é silencio
		
		OUT 42h, AL 		;manda bytes menos significativo
		MOV AL, AH
		OUT 42h, AL 		;manda byte mais significativo
		IN AL, 61h 			;verifica qual o valor está na porta 61h
		
		OR AL, 00000011b 	;seta os 2 bt - significativo
		OUT 61h, AL 		;atualiza o valor da por 61h reproduz
		MOV BX, 3h 			;determina duracao do som equival 1 seg
		
		DURA_s:
		
			MOV CX, 0FFFFh
			
		DURAC_s:
		
			DEC CX
			JNE durac_s
			DEC BX 
			JNE dura_s
				
			IN AL, 61h 				;verifica qual o valor está na porta 61h
			AND AL, 11111100b 		;zera os 2 bts - significativo
			OUT 61h, AL			 	;atualiza 61h fim reproducao
		RET
		
	Fim:
	
		INT 20h			 ;retorna pra o SO    equiv a jmp Ler_Char
		
		
	
MAIN ENDP ;finaliza procedure


;Variáveis vão aqui

msgInicial_0 DB "Alunas: Laura e Diana", 0Dh, 0AH, "$"
msgInicial2 DB "Oitava de A ate K, sendo as", 0Dh, 0AH, "$"
msgInicial2_1 DB "diagonais as notas sustenidas!", 0Dh, 0AH, "$"
msgInicial3 DB "Tecla Q fecha o programa.", 0Dh, 0AH, "$"


MC db "C", 0Dh, 0AH, "$"
MCs db "C#", 0Dh, 0AH, "$"
MD db "D", 0Dh, 0AH, "$"
MDs db "D#", 0Dh, 0AH, "$"
ME db "E", 0Dh, 0AH, "$"
MF db "F", 0Dh, 0AH, "$"
MFs db "F#", 0Dh, 0AH, "$"
MG db "G", 0Dh, 0AH, "$"
MGs db "G#", 0Dh, 0AH, "$"
MA db "A", 0Dh, 0AH, "$"
MAs db "A#", 0Dh, 0AH, "$"
MB db "B", 0Dh, 0AH, "$"
MC2 db "C*", 0Dh, 0AH, "$"

COD ENDS ;finaliza segmento
END MAIN ;finaliza programa