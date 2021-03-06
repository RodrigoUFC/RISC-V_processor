module Datapath_tb();
  reg [63:0]instructionAddress_tb;
  reg clk_tb;
  reg [63:0]ReadData2_tb;  
  reg [63:0]InstructionExtended_tb;
  
  wire [63:0]ALUInput_tb;
  wire [3:0]ALUControl_tb;
  
  /*Datapath DUT(.instructionAddress(instructionAddress_tb),
  .clk(clk_tb),.ReadData2(ReadData2_tb),
  .InstructionExtended(InstructionExtended_tb),
  .ALUInput(ALUInput_tb),
  .ALUControl(ALUControl_tb));
  */
  Datapath DUT(.instructionAddress(instructionAddress_tb),.clk(clk_tb));
  
  initial
  begin
    clk_tb = 1'b0; //LDUR
    #1;
    instructionAddress_tb = 64'b0;
    clk_tb = 1'b1;
    //ReadData2_tb = 64'b0;
    //InstructionExtended_tb = 64'b1000;
	  #5;
	  instructionAddress_tb = 64'b100;
    #5;
    instructionAddress_tb = 64'b1000;
    #5;
    instructionAddress_tb = 64'b1100;
    #5;	  
  end
  always #4 clk_tb = ~clk_tb;
endmodule
