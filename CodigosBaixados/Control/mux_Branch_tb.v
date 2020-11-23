module mux_Branch_tb();
reg[11:0] AdderOut;
reg[11:0] AddALUOut;
reg Select;
wire[11:0] PC;

mux_Branch MUX (.AdderOut(AdderOut),.AddALUOut(AddALUOut),.Select(Select),.PC(PC));
initial
begin
AdderOut = 5'b00000;
AddALUOut = 5'b11111;
Select = 1'b0;

#10
AdderOut = 5'b00000;
AddALUOut = 5'b11111;
Select = 1'b1;

end
initial
begin
$display("time \t AdderOut AddALUOut Select PC" );
$monitor("%0t \t %b %b %b %b", $time,AdderOut, AddALUOut, Select, PC);
end

endmodule