/*
	Unsigned
*/

//////////////////////////////////
// Left Shifter Unit Structure & Logic Modules
//////////////////////////////////

module Shift_Left2 (In, Out);
  input[63:0] In;
  output [63:0] Out;
  
  assign Out = (In << 2);


endmodule