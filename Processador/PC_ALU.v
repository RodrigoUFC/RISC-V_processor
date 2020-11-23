module PC_ALU (actualPC, nextPC);
  input [63:0] actualPC;
  output reg [63:0] nextPC;


  
  always @(actualPC) 
  begin
	nextPC <= actualPC + 3'b100;
  end

endmodule