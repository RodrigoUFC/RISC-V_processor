module mux_ALUSrc(input[63:0] ReadData2,input[63:0] Instruction31to0Extended,input ALUSrc,output[63:0] Out);


assign Out = (ALUSrc) ? Instruction31to0Extended:ReadData2 ; 

endmodule 