module mux_MemtoReg(ReadData,ALUResult,MemtoRead,WriteData);

input[63:0] ReadData;
input[63:0] ALUResult;
input MemtoRead;
output[63:0] WriteData;

assign WriteData = (MemtoRead) ? ReadData:ALUResult ;


endmodule
