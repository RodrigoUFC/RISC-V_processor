module mux_Branch(AdderOut,AddALUOut,Select,PC);

input[11:0] AdderOut;
input[11:0] AddALUOut;
input Select;
output[11:0] PC;

assign PC =  (Select)? AddALUOut:AdderOut;

endmodule
