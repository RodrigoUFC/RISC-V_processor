module Control(
input [10:0] Opcode,
output reg Reg2Loc,
output reg Branch,
output reg MemRead,
output reg MemtoReg,
output reg [1:0]ALUOp,
output reg MemWrite,
output reg ALUSrc,
output reg RegWrite
);
always @(Opcode)
	begin
		//------------------------------R-FORMAT----------------------------------
		if (Opcode == 11'b10001011000 | Opcode == 11'b11001011000 | Opcode == 11'b10001010000 | Opcode == 11'b10101010000) //Mesmos outputs para todas as instruções R Format
			begin
				Reg2Loc = 1'b0;
				ALUSrc = 1'b0;
				MemtoReg = 1'b0;
				RegWrite = 1'b1;
        MemRead = 1'b0;
				MemWrite = 1'b0;
				Branch = 1'b0;
				ALUOp = 2'b10;
			end

		if (Opcode == 11'b11111000010) //LDUR
			begin
				Reg2Loc = 1'b0; // Dont care
				ALUSrc = 1'b1;
				MemtoReg = 1'b1;
				RegWrite = 1'b1;
				MemRead = 1'b1;
				MemWrite = 1'b0;
				Branch = 1'b0;
				ALUOp = 2'b00;
			end
		if (Opcode == 11'b11111000000) //STUR
			begin
				Reg2Loc = 1'b1;
				ALUSrc = 1'b1;
				MemtoReg = 1'b1; //DONT CARE
				RegWrite = 1'b0;
				MemRead = 1'b0;
				MemWrite = 1'b1;
				Branch = 1'b0;
				ALUOp = 2'b00;
			end
		if ((Opcode>>3) == 8'b10110100) //CBZ
			begin
				Reg2Loc = 1'b1;
				ALUSrc = 1'b0;
				MemtoReg = 1'b1; // DONT CARE
				RegWrite = 1'b0;
				MemRead = 1'b0;
				MemWrite = 1'b0;
				Branch = 1'b1;
				ALUOp = 2'b01;
			end
	end
endmodule	