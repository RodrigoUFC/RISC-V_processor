
module Control_tb;

  	reg[10:0] tb_Opcode;
	wire tb_Reg2Loc, tb_ALUSrc, tb_MemtoReg, tb_RegWrite, tb_MemRead, tb_MemWrite, tb_Branch;
	wire [1:0] tb_ALUOp;


  
  Control DUT
  (
	.Opcode(tb_Opcode),
	.Reg2Loc(tb_Reg2Loc),
	.ALUSrc(tb_ALUSrc),
	.MemtoReg(tb_MemtoReg),
	.RegWrite(tb_RegWrite),
	.MemRead(tb_MemRead),
	.MemWrite(tb_MemWrite),
	.Branch(tb_Branch),
	.ALUOp(tb_ALUOp)
  ); 

  initial
   begin
	tb_Opcode = 11'b11111000010; //LDUR
	#10
	tb_Opcode = 11'b11111000000; //STUR
	#10
	tb_Opcode = 11'b10001011000; //ADD
	#10
	tb_Opcode = 11'b11001011000; //SUB
	#10
	tb_Opcode = 11'b10001010000; //AND
	#10
	tb_Opcode = 11'b10101010000; //ORR
	#10
	tb_Opcode = 11'b10110100000; //CBZ
	
   end
  initial
   begin
      $display("time \t Opcode Reg2Loc ALUSrc MemtoReg RegWrite MemRead MemWrite Branch ALUOp");
      $monitor("%0t \t %b %b %b %b %b %b %b %b %b", $time, tb_Opcode, tb_Reg2Loc, tb_ALUSrc, tb_MemtoReg, tb_RegWrite, tb_MemRead, tb_MemWrite, tb_Branch, tb_ALUOp);
   end
endmodule