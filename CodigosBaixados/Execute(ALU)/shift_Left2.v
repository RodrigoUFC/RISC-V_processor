module Shift_Left2 (branchAdress,shiftedBranchAddress);
 input[63:0] branchAdress;
 output reg [63:0] shiftedBranchAddress;

  always @(branchAdress) begin
    shiftedBranchAddress = branchAdress << 2;
  end

endmodule

