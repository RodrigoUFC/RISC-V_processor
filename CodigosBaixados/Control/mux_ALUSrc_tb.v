module mux_ALUSrc_tb;

reg[63:0] ReadData2;
reg[63:0] Instruction31to0Extended;
reg ALUSrc;
wire[63:0] Out;

mux_ALUSrc MUX (.ReadData2(ReadData2), .Instruction31to0Extended(Instruction31to0Extended),.ALUSrc(ALUSrc),.Out(Out));

initial 
begin
ReadData2 = 5'b00000;
Instruction31to0Extended = 5'b11111;
ALUSrc = 1'b0;

#10 

ReadData2 = 5'b00000;
Instruction31to0Extended = 5'b11111;
ALUSrc = 1'b1;

end
initial
begin
$display("time \t ReadData2 Instruction31to0Extended ALUSrc Out" );
$monitor("%0t \t %b %b %b %b", $time,ReadData2, Instruction31to0Extended, ALUSrc, Out);
end 


endmodule 
