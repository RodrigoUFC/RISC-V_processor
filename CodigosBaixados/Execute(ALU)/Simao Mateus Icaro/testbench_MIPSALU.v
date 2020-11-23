module testbench_MIPSALU;

  reg [31:0] A, B; 
  reg[3:0] ALUctl;
  wire[31:0] ALUOut;
  wire zero;

  MIPSALU unidade (ALUctl, A, B, ALUOut, zero);
  
  initial
    begin
      $monitor("%0t \t %b %b %b %b %b", $time, A, B, zero, ALUOut, ALUctl);
     // Realizando o teste para cada função do ALUControl    

     //TESTES COM AND (CTL = 0)
      A= 32'b0010 ;  B=32'b1111 ;  ALUctl = 4'b0000; //AND (resultado sera 64'b0010)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=64'b11111111111111111111111111111111 ;  ALUctl = 4'b0000; //AND (resultado 1111111...)
	#10;
      A= 32'b0000 ;  B=32'b1010 ;  ALUctl = 4'b0000; //AND (resultado sera 0000)
	#10;
      A= 32'b1111 ;  B=32'b1010 ;  ALUctl = 4'b0000; //AND (resultado sera 1010)
	#10;
      A= 32'b0101 ;  B=32'b1010 ;  ALUctl = 4'b0000; //ADD (resultado sera 0000)
	#10;

     //TESTES COM OR (CLT = 1)
      A= 32'b0000 ;  B=32'b1111 ;  ALUctl = 4'b0001; //OR (resultado sera 64'b1111)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=32'b11111111111111111111111111111111 ;  ALUctl = 4'b0001; //OR (resultado 1111111...)
	#10;
      A= 32'b1111 ;  B=32'b1010 ;  ALUctl = 4'b0001; //OR (resultado sera 1111)
	#10;
      A= 32'b1011 ;  B=32'b1010 ;  ALUctl = 4'b0001; //OR (resultado sera 1011)
	#10;
      A= 32'b0000 ;  B=32'b0000 ;  ALUctl = 4'b0001; //OR (resultado sera 0000)
	#10;


     //TESTES COM SOMA (CLT = 2)
      A= 32'b1000 ;  B=32'b0101 ;  ALUctl = 4'b0010; //SUM (resultado sera 64'b1101)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=32'b11111111111111111111111111111111 ;  ALUctl = 4'b0010; //SUM COM OVERFLOW (resultado 1111111...)
	#10;
      A= 32'b1111 ;  B=32'b1000 ;  ALUctl = 4'b0010; //SUM (resultado sera 10111)
	#10;
      A= 32'b1011 ;  B=32'b1010 ;  ALUctl = 4'b0010; //SUM (resultado sera 10101)
	#10;
      A= 32'b0000 ;  B=32'b0000 ;  ALUctl = 4'b0010; //SUM (resultado sera 0000)
	#10;

      //TESTES COM SUB (CLT = 6)
      A= 32'b1000 ;  B=32'b0101 ;  ALUctl = 4'b0110; //SUB (resultado sera 64'b1101)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=32'b11111111111111111111111111111111 ;  ALUctl = 4'b0110; //SUB(resultado 0000000000...)
	#10;
      A= 32'b1111 ;  B=32'b1000 ;  ALUctl = 4'b0110; //SUB (resultado sera 10111)
	#10;
      A= 32'b1011 ;  B=32'b1010 ;  ALUctl = 4'b0110; //SUB (resultado sera 10101)
	#10;
      A= 32'b0000 ;  B=32'b0000 ;  ALUctl = 4'b0110; //SUB (resultado sera 0000)
	#10;

      //TESTES COM COND A<B (CLT = 7)
      A= 32'b1000 ;  B=32'b0101 ;  ALUctl = 4'b0111; //COMP (resultado sera 0)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=32'b11111111111111111111111111111111 ;  ALUctl = 4'b0111; //COMP (resultado 0)
	#10;
      A= 32'b0001 ;  B=32'b1000 ;  ALUctl = 4'b0111; //COMP (resultado sera 1)
	#10;
      A= 32'b1011 ;  B=32'b1010 ;  ALUctl = 4'b0111; //COMP (resultado sera 0)
	#10;
      A= 32'b0000 ;  B=32'b0001 ;  ALUctl = 4'b0111; //COMP (resultado sera 1)
	#10;

      //TESTES COM NOR (CLT = 12)
      A= 32'b1000 ;  B=32'b0101 ;  ALUctl = 4'b1010; //COMP (resultado sera 0)
	#10;
      A= 32'b11111111111111111111111111111111 ;  B=32'b11111111111111111111111111111111 ;  ALUctl = 4'b1010; //COMP (resultado 0)
	#10;
      A= 32'b0001 ;  B=32'b1000 ;  ALUctl = 4'b1010; //COMP (resultado sera 1)
	#10;
      A= 32'b1011 ;  B=32'b1010 ;  ALUctl = 4'b1010; //COMP (resultado sera 0)
	#10;
      A= 32'b0000 ;  B=32'b0001 ;  ALUctl = 4'b1010; //COMP (resultado sera 1)
	#10;

	$finish;
    end
endmodule