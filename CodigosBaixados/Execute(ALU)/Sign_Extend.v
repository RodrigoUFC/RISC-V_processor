module Sign_Extend (instruction, extendedInstruction);
  input[31:0] instruction;
  output reg [63:0] extendedInstruction;


//The unconditional branch instruction looks like a branch instruction with a longer offset 
//but it is not conditional. Like a branch, the low-order 2 bits of a branch address are always
//00two. The next 26 bits of this 64-bit address come from the 26-bit immediate field in the 
//instruction and then are sign extended. Thus, we can implement a branch
//by storing into the PC sum of the PC and the sign extended and shifted 26-bit offset.



  always @(instruction) begin
//Since the input is all 32 bits of the instruction, it can use the opcode bits of
//the instruction to select the proper field.

	if (instruction[31:23] == 9'b111110000) // LDUR or STUR
		begin
			if(instruction[20]) //ve o sinal (porque eh o bit de sinal)
				begin
					extendedInstruction[8:0] <= instruction[20:12]; //pega o 'Address' do LDUR e do STUR e preenche o vetor (extendedInstruction) com os 9 dados de bit dele.

					extendedInstruction[63:9] <= {55{1'b1}}; //Se a posicao 20 for 1, ele preenche os bits restantes com 1 (que eh oq o sign extend diz pra fazer)
				end
			else
				begin 
					extendedInstruction[8:0] <= instruction[20:12]; // mesma coisa do processo acima, mas com a posicao 20 sendo 0
			        	extendedInstruction[63:9] <= {55{1'b0}};
				end
		end
	else
		begin
			if(instruction[31:24] == 8'b10110100 || instruction[31:24] == 8'b10110101) // CBZ, or CBNZ
				begin
					if(instruction[23])
						begin
							extendedInstruction[18:0] <= instruction[23:5]; //aloca os 19 bits no inicio

							extendedInstruction[63:19] <= {45{1'b1}}; // se a posicao 23 for 1, preenche o restante com 1
						end
					else
						begin 
							extendedInstruction[18:0] <= instruction[23:5]; 

							extendedInstruction[63:19] <= {45{1'b0}};
						end
				end
			else
				if(instruction[31:22] == 10'b1001000100) // ADDI eh um I-type (sign extend nao eh necessario para R-type) ver o 'Immediate' (vai do 0 ao 15)

					begin
						if(instruction[15])
							begin
								extendedInstruction[15:0] <= instruction[15:0]; 
								extendedInstruction[63:16] <= {48{1'b1}}; 
							end
						else
							begin 
								extendedInstruction[15:0] <= instruction[15:0];
								extendedInstruction[63:16] <= {48{1'b0}};
							end
					end
				else
					begin
						if(instruction[31:26] == 6'b000101) // B
							begin
	        //LEGv8 opcode bit 26 happens to be 0 for data transfer instructions and 1 for conditional branch

								if(instruction[25]) //  se o bit 26 do opcode for 1 para bit condicionais
									begin
										extendedInstruction[25:0] <= instruction[25:0];
										extendedInstruction[63:26] <= {38{1'b1}};
									end
								else
									begin 
										extendedInstruction[25:0] <= instruction[25:0];
										extendedInstruction[63:26] <= {38{1'b0}};
									end
							end
					end
		end
	end
endmodule

