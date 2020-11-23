module MIPSALU (ALUctl, A, B, ALUOut, Zero);
	input [3:0] ALUctl;
	input [31:0] A,B;
	output reg [31:0] ALUOut;
	output Zero;
	assign Zero = (ALUOut==0); // Zero � verdadeiro se ALUOut � 0; vai para algum luga
	always @(ALUctl, A, B) // reavalia se estes mudarem
	case (ALUctl)
		0: ALUOut <= A & B;
		1: ALUOut <= A | B;
		2: ALUOut <= A + B;
		6: ALUOut <= A - B;
		7: ALUOut <= A < B ? 1 :0;
		12: ALUOut <= ~(A | B); // resultado � nor
		default: ALUOut <= 0; // default � 0, n�o dever� acontecer;
	endcase
endmodule