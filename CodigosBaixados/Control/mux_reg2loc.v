module mux_reg2loc(Instruction20to16,Instruction4to0,Reg2Loc,ReadRegister2);

input[4:0] Instruction20to16;
input[4:0] Instruction4to0;
input Reg2Loc;
output[4:0] ReadRegister2;


assign ReadRegister2 = (Reg2Loc) ? Instruction4to0:Instruction20to16 ; 

endmodule 