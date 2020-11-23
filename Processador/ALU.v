module ALU (ALUControl, readDataRegister1, inputSaidaMuxALUSrc, zeroFlag, ALUResult, carryFlag, negativeFlag,overflowFlag); 
input [3:0] ALUControl;
input [63:0] readDataRegister1; 
input [63:0] inputSaidaMuxALUSrc;
output reg [63:0] ALUResult;
output  reg zeroFlag;
output  reg carryFlag;
output  reg negativeFlag;
output  reg overflowFlag;
reg [64:0] temp;

  always@(readDataRegister1 or inputSaidaMuxALUSrc or ALUControl) begin

    case (ALUControl)
      4'b0000: //AND
        temp = readDataRegister1 & inputSaidaMuxALUSrc;
      4'b0001: //OR
        temp = readDataRegister1 | inputSaidaMuxALUSrc;
      4'b0010: //ADD
        temp = readDataRegister1 + inputSaidaMuxALUSrc;
      4'b0110: //SUB
        temp = readDataRegister1 - inputSaidaMuxALUSrc;
      4'b0111: // EOR
        temp = readDataRegister1 ^  inputSaidaMuxALUSrc; 	
    endcase
    ALUResult = temp[63:0];
    negativeFlag = ALUResult[63];    
    carryFlag    =  (ALUControl[1] & temp[64]);
    overflowFlag =  (ALUControl[1] & ((readDataRegister1[63] ~^ inputSaidaMuxALUSrc[63]) & (temp[64]^temp[63]))); 
    zeroFlag = (ALUResult == 0);

    
  
  end 
    

endmodule
