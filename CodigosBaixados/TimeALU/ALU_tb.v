module ALU_tb;

 reg [63:0] readDataRegister1, inputSaidaMuxALUSrc; 
 reg[3:0] ALUControl;
 wire[63:0] ALUResult;
 wire zeroFlag;
 wire carryFlag;
 wire negativeFlag;
 wire overflowFlag;


  ALU modulo (ALUControl, readDataRegister1, inputSaidaMuxALUSrc, zeroFlag, ALUResult, carryFlag, negativeFlag,overflowFlag);
  
 
  
  initial
    begin
      $monitor("%0t \t %b %b %b %b %b %b ", $time, readDataRegister1, inputSaidaMuxALUSrc,ALUControl,  ALUResult, overflowFlag, zeroFlag, negativeFlag,carryFlag );
     // Realizando o teste para a flag Carry
     readDataRegister1= 64'hFFFFFFFFFFFFFFFF; inputSaidaMuxALUSrc=64'h0001 ;  ALUControl = 4'b0010; //ADD (carry flag turned on -- truncou (zero flag on)
	#10;
     readDataRegister1= 64'h0FFFFFFFFFFFFFFF; inputSaidaMuxALUSrc=64'h0001 ;  ALUControl = 4'b0010; //ADD (carry flag turned off)
	#10;
     readDataRegister1= 64'h0000; inputSaidaMuxALUSrc=64'h0001 ;  ALUControl = 4'b0110; //SUB (carry flag turned on -- negative flag on )
	#10;
     readDataRegister1= 64'hF000000000000000 ;inputSaidaMuxALUSrc=64'h0001 ;  ALUControl = 4'b0110; //SUB (carry flag turned off - negative flag on )
	#10;
// Realizando o teste para flag overflow
      readDataRegister1= 64'h0100;  inputSaidaMuxALUSrc=64'h0100;  ALUControl = 4'b0010; //ADD  (soma de dois numeros positivos era para ser positivo, se não overflow flag on )
	#10;
      readDataRegister1= 64'h8000000000000000 ;  inputSaidaMuxALUSrc=64'h8000000000000000;  ALUControl = 4'b0010; //ADD (soma de dois numeros negativos era para ser negativo, se não overflow flag on)
	#10;
      readDataRegister1= 64'h0800000000000000 ;  inputSaidaMuxALUSrc=64'h8000000000000000 ;  ALUControl = 4'b0110; //SUB (positivo menos negativo é p ser positivo, se não overflow flag on)
	#10;
      readDataRegister1= 64'h8000000000000000 ;  inputSaidaMuxALUSrc=64'h0800000000000000 ; ALUControl= 4'b0110; //SUB (negativo menos positivo é p ser negativo, se não overflow flag on)
	#10;
// Realizando o teste para a flag zero
     readDataRegister1= 64'hFFFFFFFFFFFFFFFF ;  inputSaidaMuxALUSrc=64'hFFFFFFFFFFFFFFFF ;  ALUControl = 4'b0110; //SUB (zeroFlag on / 15- 15 = 0)
	#10;
     readDataRegister1= 64'b0101 ;  inputSaidaMuxALUSrc= 64'b0100 ;  ALUControl = 4'b0110; //SUB (zeroFlag off / 5-4 = 1)
	#10;
	
	// Realizando o teste para a flag negative
     readDataRegister1= 64'hD000000000000000 ;  inputSaidaMuxALUSrc=64'hC000000000000000 ;  ALUControl = 4'b0010; //ADD (negative on)
	#10;
    readDataRegister1= 64'h5000000000000000 ;  inputSaidaMuxALUSrc=64'h6000000000000000 ;  ALUControl = 4'b0110; //SUB (negative on/ 5-6 = -1)
	#10;

// Realizando o teste para cada função do ALUControl
      readDataRegister1= 64'h1010 ;  inputSaidaMuxALUSrc=64'h1111 ;  ALUControl = 4'b0001; //OR (resultado sera 1111)
	#10;
      readDataRegister1= 64'h1010 ;  inputSaidaMuxALUSrc=64'h1111 ;  ALUControl = 4'b0000; //AND (resultado sera 1010)
	#10;
      readDataRegister1= 64'h1010 ;  inputSaidaMuxALUSrc=64'h1111 ;  ALUControl = 4'b0010; //ADD (resultado sera 1010)
	#10;
      readDataRegister1= 64'h1010 ;  inputSaidaMuxALUSrc=64'h1111 ; ALUControl = 4'b0110; //SUB (resultado sera 0101)
	#10;
      readDataRegister1= 64'h1010 ;  inputSaidaMuxALUSrc=64'h1111 ;  ALUControl = 4'b0111; //EOR
	#10;
    

 
      readDataRegister1= 2 ;  inputSaidaMuxALUSrc=64'hA000000000000000 ; ALUControl = 4'b0001; //OR testando com um inteiro (resultado sera 1010).
	#10;
      end
endmodule