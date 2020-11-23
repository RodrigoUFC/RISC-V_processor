module ALUControl (ALUOp, FuncCode, ALUCtl);
	input [1:0] ALUOp;
	input [5:0] FuncCode;
	output reg [3:0] ALUCtl;
	
	always case (FuncCode)
		32: ALUCtl <= 2;  // soma
		34: ALUCtl <= 6;  // subtrai
		36: ALUCtl <= 0;  // and
		37: ALUCtl <= 1;  // or
		39: ALUCtl <= 12; // nor
		42: ALUCtl <= 7;  // slt
		default: ALUCtl <= 15; // n�o dever� acontecer
	endcase
endmodule


