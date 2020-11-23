module mux_reg2loc_tb();

reg[4:0] Instruction20to16;
reg[4:0] Instruction4to0;
reg Reg2Loc;
wire[4:0] ReadRegister2;

mux_reg2loc MUX ( .Instruction20to16(Instruction20to16),.Instruction4to0(Instruction4to0),.Reg2Loc(Reg2Loc), .ReadRegister2(ReadRegister2));

initial 
begin
Instruction20to16 = 5'b0000;
Instruction4to0 =5'b11111;
Reg2Loc = 1'b0;
#10  
Instruction20to16 = 5'b0000;
Instruction4to0 = 5'b11111;
Reg2Loc = 1'b1;

end 
initial
begin
$display("time \t Intruction20to16 Instruction4to0 Reg2Loc ReadRegister2" );
$monitor("%0t \t %b %b %b %b", $time,Instruction20to16, Instruction4to0, Reg2Loc, ReadRegister2);
end
endmodule 
