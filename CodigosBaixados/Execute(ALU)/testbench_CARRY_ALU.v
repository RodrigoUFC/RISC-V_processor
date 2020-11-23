module testbench_CARRY_ALU;

  reg [63:0] A, B; 
  reg[63:0] ALUcontrol;
  wire[63:0] ALUresult;
  wire zero;
  wire carry;
  wire negative;

  ALU_CARRY unidade (A, B, zero, negative,carry, ALUresult, ALUcontrol);
  
  initial
    begin
      $monitor("%0t \t %b %b %b %b %b %b ", $time, A, B, zero, negative,carry, ALUresult, ALUcontrol);
     // Realizando o teste para cada função do ALUControl
     
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0010; //ADD (resultado sera 11001)
	#10;
      A= 64'b11111111111111111111111111111111 ;  B=64'b11111111111111111111111111111111 ;  ALUcontrol = 4'b0010; //ADD onde a soma eh maior que 32bits
	#10;
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0001; //OR (resultado sera 1111)
	#10;
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0000; //AND (resultado sera 1010)
	#10;
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0010; //ADD (resultado sera 1010)
	#10;
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0110; //SUB (resultado sera 0101)
	#10;
      A= 64'b0101 ;  B=64'b1010 ;  ALUcontrol = 4'b0110; //SUB onde A < B (resultado sera 11...1011)
	#10;
      A= 64'b1010 ;  B=64'b1010 ;  ALUcontrol = 4'b0110; //SUB onde o resultado sera 0 (coluna do zero esta somando +1)
	#10;
      A= 2 ;  B=64'b1010 ;  ALUcontrol = 4'b0001; //OR testando com um inteiro (resultado sera 1010).
	#10;
      A= 64'b1111 ;  B=64'b1010 ;  ALUcontrol = 4'b0111; //EOR
	#10;
    end
endmodule