module instruction_memory (instructionAddress,clk,instruction);

    input[63:0] instructionAddress; //Program Counter (PC) vai apontar pra qual endere�o da mem�ria ser� lido nesse ciclo de clock (depois soma 4 - pula uma word)
    input clk;
    output reg [31:0] instruction;      //instru��o que ser� a sa�da do bloco instruction memory (ela ser� a instru��o tal qual o PC apontar�) (envia 4 bytes pro instruction decoder)


    reg [7:0] memory_depth[0:4095]; //simula��o de uma mem�ria com os comandos explicitados pelo professor (essa mem�ria tem 4k bits ou 512 bytes)

initial
begin   //come�a a escrever a mem�ria (isso � o c�digo q vc programa em C e vai pra mem�ria de programa para o processador ler e executar os comandos)
//essa mem�ria est� dividida em bytes

    memory_depth[0] = 8'b00100000;  //ADDS X0, X1, X2 (implementando ADDS)
    memory_depth[1] = 8'b00000000;  //200002AB em hexadecimal
    memory_depth[2] = 8'b00000010;  //00100000 00000000 00000010 10101011
    memory_depth[3] = 8'b10101011;  //OK

//instruction = 10101011 00000010 00000000 00100000 QUANDO instructionAddress = 0 INSTRU��O TYPE-R

    memory_depth[4] = 8'b00100000;  //ADDS X0, X1, #8   (implementando ADDIS)
    memory_depth[5] = 8'b00100000;  //202000B1 em hexadecimal
    memory_depth[6] = 8'b00000000;  //00100000 00100000 00000000 10110001
    memory_depth[7] = 8'b10110001;  //OK

//instruction = 10110001 00000000 00100000 00100000 QUANDO instructionAddress = 4 INSTRU��O TYPE-I


    memory_depth[8] = 8'b00100000;  //SUBS X0, X1, X2   (implementando SUBS)
    memory_depth[9] = 8'b00000000;  //200002EB em hexadecimal
    memory_depth[10] = 8'b00000010; //00100000 00000000 00000010 11101011
    memory_depth[11] = 8'b11101011; //OK

//instruction = 11101011 00000010 00000000 00100000 QUANDO instructionAddress = 8 INSTRU��O TYPE-R

    memory_depth[12] = 8'b00100000; //SUBIS X0, X1, #8  (implementando SUBIS)
    memory_depth[13] = 8'b00100000; //202000F1 em hexadecimal
    memory_depth[14] = 8'b00000000; //00100000 00100000 00000000 11110001
    memory_depth[15] = 8'b11110001; //OK

//instruction = 11110001 00000000 00100000 00100000 QUANDO instructionAddress = 12 INSTRUC�O TYPE-I

    memory_depth[16] = 8'b00100000; //AND X0, X1, X2    (implementando AND)
    memory_depth[17] = 8'b00000000; //2000028A em hexadecimal
    memory_depth[18] = 8'b00000010; //00100000 00000000 00000010 10001010
    memory_depth[19] = 8'b10001010; //OK

//instruction = 10001010 00000010 00000000 00100000 QUANDO instructionAddress = 16 INSTRU��O TYPE-R

    memory_depth[20] = 8'b00100000; //ORR X0, X1, X2    (implementando ORR)
    memory_depth[21] = 8'b00000000; //200002AA em hexadecimal
    memory_depth[22] = 8'b00000010; //00100000 00000000 00000010 10101010
    memory_depth[23] = 8'b10101010; //OK

//instruction = 10101010 00000010 00000000 00100000 QUANDO instructionAddress = 20 INSTRU��O TYPE-R

    memory_depth[24] = 8'b00100000; //EOR X0, X1, X2    (implementando EOR)
    memory_depth[25] = 8'b00000000; //200002CA em hexadecimal
    memory_depth[26] = 8'b00000010; //00100000 00000000 00000010 11001010
    memory_depth[27] = 8'b11001010; //OK

//instruction = 11001010 00000010 00000000 00100000 QUANDO instructionAddress = 24 INSTRU��O TYPE-R

    memory_depth[28] = 8'b00100000; //LDUR X0, [X1, #8]
    memory_depth[29] = 8'b10000000; //208040F8 em hexadecimal
    memory_depth[30] = 8'b01000000; //00100000 10000000 01000000 11111000
    memory_depth[31] = 8'b11111000; //OK

//instruction = 11111000 01000000 10000000 00100000 QUANDO instructionAddress = 28 INSTRU��O TYPE-D

    memory_depth[32] = 8'b00100000; //STUR X0, [X1, #16]
    memory_depth[33] = 8'b00000000; //200001F8 em hexadecimal
    memory_depth[34] = 8'b00000001; //00100000 00000000 00000001 11111000
    memory_depth[35] = 8'b11111000; //OK

//instruction = 11111000 00000001 00000000 00100000 QUANDO instructionAddress = 32 INSTRU��O TYPE-D

//INSTU��ES EXTRAS

    memory_depth[36] = 8'b01000001; //CBZ X1, #8
    memory_depth[37] = 8'b00000000; //410000B4 em hexadecimal
    memory_depth[38] = 8'b00000000; //01000001 00000000 00000000 10110100
    memory_depth[39] = 8'b10110100; //OK

//instruction = 10110100 00000000 00000000 01000001 QUANDO instructionAddress = 36 INSTRU��O DE CONDITIONAL BRANCH

    memory_depth[40] = 8'b00000010; //B #8
    memory_depth[41] = 8'b00000000; //02000014 em hexadecimal
    memory_depth[42] = 8'b00000000; //00000010 00000000 00000000 00010100
    memory_depth[43] = 8'b00010100; //OK

//instruction = 00010100 00000000 00000000 00000010 QUANDO instructionAddress = 40 INSTRU��O DE UNCONDITIONAL BRANCH



/* Instru��es
utilizando esse site: http://armconverter.com/ vamos implementar as instru��es que o Jarbas pede:

Arithmetic (Type R)
ADDS e ADDIS
SUBS e SUBIS
Logical (Type R)
AND, ORR e EOR
Data transfer (Type D)
LDUR e STUR

*/


end

always@(posedge clk)
begin

instruction = {memory_depth[instructionAddress+3], memory_depth[instructionAddress+2], memory_depth[instructionAddress+1], memory_depth[instructionAddress]}; //pega os 4 bytes e manda pro pr�ximo bloco, que vai decodificar
end

endmodule