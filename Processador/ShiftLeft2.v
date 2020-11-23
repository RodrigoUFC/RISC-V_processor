module Shift_Left2 (extendedAdddress, shiftedAddress);
  input  [63:0] extendedAdddress;
  output [63:0] shiftedAddress;
  

  
  assign shiftedAddress = (extendedAdddress << 2);


endmodule
