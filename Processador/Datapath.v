module Datapath(clk,ALUResult);
  input clk;
  output [63:0]ALUResult;
  
  wire [31:0]instructionAddress;
  wire [4:0]rm;
  wire [4:0]rt;
  wire [4:0]rn;
  wire [5:0]shamt;
  wire [18:0]address;
  wire [31:0]instruction; 
  wire [10:0]Opcode; 

  instruction_memory DUTIMemory(
  .instructionAddress(instructionAddress),
  .clk(clk),
  .instruction(instruction));
  
  decoder DUTDecoder (
  .instruction(instruction), 
  .opcode(Opcode), 
  .rm(rm), 
  .shamt(shamt), 
  .rn(rn), 
  .rt(rt), 
  .address(address));
  
  Control DUTControl (
  .Opcode(Opcode),
  .Reg2Loc(Reg2Loc),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .ALUOp(ALUOp),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite)
  );
  
  ALUControl DUTALUControl (
  .Opcode(Opcode),
  .ALUOp(ALUOp),
  .ALUControl(ALUControl)
  )

endmodule