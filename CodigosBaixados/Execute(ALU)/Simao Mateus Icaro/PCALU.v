/*
	Unsigned 
*/

//////////////////////////////////
//  PC Incrementer Unit Structure & Logic Modules
//////////////////////////////////

module IncrPC (PC, Out);
  input[11:0] PC;
  output[11:0] Out;

  reg[11:0] Out;
  
  always @(PC) 
  begin
	Out <= PC + 3'b100;
  end

endmodule
