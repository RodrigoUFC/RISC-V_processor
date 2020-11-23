module testbench_shift_left;

  reg [63:0] branchAdress;
  wire [63:0] shiftedBranchAddress;

  Shift_Left2 unidade (branchAdress,shiftedBranchAddress);
  
  initial
    begin
      $monitor("%0t \t %b %b ", $time, branchAdress,shiftedBranchAddress);
     
     branchAdress = 64'b1111;
	#10;
     branchAdress = 64'b0111;
    end
endmodule
