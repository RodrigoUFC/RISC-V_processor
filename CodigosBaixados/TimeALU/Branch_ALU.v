module PCShiftAdder (actualPC, shiftedBranchAddress, branchAdress);
  input [63:0] actualPC;
  input [63:0] shiftedBranchAddress; 
  output reg [63:0] branchAdress;


  
  always @(actualPC, shiftedBranchAddress) 
  begin
	branchAdress <= actualPC + shiftedBranchAddress[18:0];
  end

endmodule
