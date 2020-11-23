module decoder (clk, instruction, opcode, rm, shamt, rn, rt, address);

	input clk; 			//clock que devemos fazer
	input[31:0] instruction; 	//entrada da instrução (saída do bloco de instruction memory)
	
	output reg [10:0] opcode; 		//qual operação será realizada 11 bits
	output reg [4:0] rm; 		//o segundo registrador da ?fonte?
	output reg [5:0] shamt; 		//quantidade de shift
	output reg [4:0] rn;			//o primeiro registrador da ?fonte?
	output reg [4:0] rt; 			//rd no livro, o registrador de destino
	output reg [18:0] address;		//não sei pq isso tem 19 bits




/*PARA INSTRUÇÕES TYPE R

opcode = instruction[31:21];
rm = instruction[20:16];
shamt = instruction[15:10];
rn = instruction[9:4];
rt = instruction[4:0];

PARA INSTRUÇÕES TYPE I

opcode = instruction[31:22];
address = instruction[21:10];	//immediate (foi utilizada a saida de address)
rn = instruction[9:5];
rt = instruction[4:0];

PARA INSTRUÇÕES TYPE D

opcode = instruction[31:21];
address = instruction[20:10];
rn = instruction[9:5];
rt = instruction[4:0];

*/


always @(posedge clk)

begin

if(instruction[31:21] == 11'b11111000010 || 11'b11111000000)	// se o comando for LOAD OU STORE
begin
	opcode = instruction[31:21];
	address = instruction[20:10];
	rn = instruction[9:5];
	rt = instruction[4:0];
end
else							//senão, se for I-TYPE
	begin
		if(instruction[31:22] == 1011000100)
			begin
				opcode = instruction[31:22];
				address = instruction[21:10];	//immediate
				rn = instruction[9:5];
				rt = instruction[4:0];

			end
		else					// senão será R-TYPE
			begin
				opcode = instruction[31:21];
				rm = instruction[20:16];
				shamt = instruction[15:10];
				rn = instruction[9:5];
				rt = instruction[4:0];
			end
	end

end

endmodule
