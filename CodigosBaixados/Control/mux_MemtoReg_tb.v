module mux_MemtoReg_tb;

reg[63:0] ReadData;
reg[63:0] ALUResult;
reg MemtoRead;
wire[63:0] WriteData;

mux_MemtoReg MUX(.ReadData(ReadData),.ALUResult(ALUResult), .MemtoRead(MemtoRead), .WriteData(WriteData));
initial
begin

ReadData = 5'b00000;
ALUResult = 5'b11111;
MemtoRead =1'b0;

#10 

ReadData = 5'b00000;
ALUResult = 5'b11111;
MemtoRead =1'b1;


end
initial
begin

$display("time \t ReadData ALUResult MemtoRead WriteData" );
$monitor("%0t \t %b %b %b %b", $time,ReadData, ALUResult, MemtoRead, WriteData); 


end
endmodule