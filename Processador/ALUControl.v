module ALUControl(
input [10:0] Opcode,
input [1:0] ALUOp,
output reg [3:0] ALUControl
);
	 
always @(Opcode, ALUOp)
	begin
		if (ALUOp == 2'b10) //R-Format
			begin 
				case(Opcode)
					11'b10001011000: ALUControl = 4'b0010; //ADD
					11'b11001011000: ALUControl = 4'b0110; //SUB
					11'b10001010000: ALUControl = 4'b0000; // AND
					11'b10101010000: ALUControl = 4'b0001; //OR
					default: ALUControl = 4'b0010;
				endcase
			end	
		if (ALUOp == 2'b01)
			begin
				ALUControl = 4'b0111; //Branch
			end
		if (ALUOp == 2'b00)
			begin
				ALUControl = 4'b0010; //LDUR e STUR
			end
	end	
		
endmodule
