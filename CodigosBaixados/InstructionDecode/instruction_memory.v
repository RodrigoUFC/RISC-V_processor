
module instruction_memory (instructionAddress,instruction);

	input[63:0] instructionAddress; //Program Counter (PC) vai apontar pra qual endereço da memória será lido nesse ciclo de clock (depois soma 4 - pula uma word)

	output [31:0] instruction;		//instrução que será a saída do bloco instruction memory (ela será a instrução tal qual o PC apontará) (envia 4 bytes pro instruction decoder)


	reg [7:0] memory_depth[0:4095];	//simulação de uma memória com os comandos explicitados pelo professor (essa memória tem 4k bits ou 512 bytes)

initial
begin	//começa a escrever a memória (isso é o código q vc programa em C e vai pra memória de programa para o processador ler e executar os comandos)
//essa memória está dividida em bytes

	memory_depth[0] = 8'b00100000; 	//ADDS X0, X1, X2 (implementando ADDS)
	memory_depth[1] = 8'b00000000; 	//200002AB em hexadecimal
	memory_depth[2] = 8'b00000010; 	//00100000 00000000 00000010 10101011
	memory_depth[3] = 8'b10101011; 	//

//10101011000

	memory_depth[4] = 8'b00100000; 	//ADDS X0, X1, #8 	(implementando ADDIS)
	memory_depth[5] = 8'b00100000; 	//202000B1 em hexadecimal
	memory_depth[6] = 8'b00000000; 	//00100000 00100000 00000000 10110001
	memory_depth[7] = 8'b10110001; 	//

	//1011000100    

	//10110001 00000000 00100000 00100000 = instruction quando PC = 4

	memory_depth[8] = 8'b00100000; 	//SUBS X0, X1, X2 	(implementando SUBS)
	memory_depth[9] = 8'b00100000; 	//200002EB em hexadecimal
	memory_depth[10] = 8'b00000000; 	//00100000 00100000 00000000 10110001
	memory_depth[11] = 8'b10110001; 	//

//10110001000

	memory_depth[12] = 8'b00100000;	//SUBIS X0, X1, #8 	(implementando SUBIS)
	memory_depth[13] = 8'b00000000;	//202000F1 em hexadecimal
	memory_depth[14] = 8'b00000010;	//00100000 00000000 00000010 11101011
	memory_depth[15] = 8'b11101011;	//11101011000 00010000000 00 
//11101011000

	memory_depth[16] = 8'b00100000;	//AND X0, X1, X2	(implementando AND)
	memory_depth[17] = 8'b00000000;	//2000028A em hexadecimal
	memory_depth[18] = 8'b00000010;	//00100000 00000000 00000010 10001010
	memory_depth[19] = 8'b10001010;	//

	//10001010000

	memory_depth[20] = 8'b00100000;	//ORR X0, X1, X2	(implementando ORR)
	memory_depth[21] = 8'b00000000;	//200002AA em hexadecimal
	memory_depth[22] = 8'b00000010;	//00100000 00000000 00000010 10101010
	memory_depth[23] = 8'b10101010;	//

//10101010000

memory_depth[24] = 8'b00100000;	//EOR X0, X1, X2	(implementando EOR)
	memory_depth[25] = 8'b00000000;	//200002CA em hexadecimal
	memory_depth[26] = 8'b00000010;	//00100000 00000000 00000010 11001010
	memory_depth[27] = 8'b11001010;	//

	//11001010000

memory_depth[28] = 8'b00100000;	//LDUR X0, [X1, #8]
	memory_depth[29] = 8'b10000000;	//208040F8 em hexadecimal
	memory_depth[30] = 8'b00000010;	//00100000 10000000 01000000 11111000
	memory_depth[31] = 8'b10001010;	//

//11111000010

memory_depth[32] = 8'b00100000;	//STUR X0, [X1, #16]
	memory_depth[33] = 8'b00000000;	//200001F8 em hexadecimal
	memory_depth[34] = 8'b00000010;	//00100000 00000000 00000001 11111000
	memory_depth[35] = 8'b10001010;	//
	
	//10001010000
	




/* Instruções
utilizando esse site: http://armconverter.com/ vamos implementar as instruções que o Jarbas pede:

Arithmetic (Type R)
ADDS e ADDIS
SUBS e SUBIS
Logical (Type R)
AND, ORR e EOR
Data transfer (Type D)
LDUR e STUR

*/


end



assign instruction = {memory_depth[instructionAddress+3], memory_depth[instructionAddress+2], memory_depth[instructionAddress+1], memory_depth[instructionAddress]}; //pega os 4 bytes e manda pro próximo bloco, que vai decodificar


endmodule