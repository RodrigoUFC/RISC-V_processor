module testbench_ALUControl;
  reg [1:0]ALUOperation; 
  reg[5:0] funct;
  wire[3:0] ALUcontrol;

  ALUcontrol Ctrl(ALUOperation, funct, ALUcontrol);
  
  initial
    begin
      $monitor("%0t \t %b %b ", $time, ALUOperation, funct, ALUcontrol);
//testando quando o ALUop é 00 - é para ser operacao de soma do endereco do LDR e STR
      ALUOperation= 2'b00;  funct=4'b0000; //ADD
	#5;
      ALUOperation= 2'b00;  funct=4'b0101; //ADD
	#10;
      ALUOperation= 2'b00;  funct=4'b0010; //ADD
	#10;
      ALUOperation= 2'b00;  funct=4'b0100; // ADD
	#10;
      ALUOperation= 2'b00;  funct=4'b1010; //ADD
      #10;
//testando para ALUop = 10 - operações que usam a funct (R-type)
      ALUOperation= 2'b10;  funct=4'b0000; // ADD
	#10;
      ALUOperation= 2'b10;  funct=4'b0101; // OR
	#10;
      ALUOperation= 2'b10;  funct=4'b0010; // SUB
	#10;
      ALUOperation= 2'b10;  funct=4'b0100; // AND
	#10;
      ALUOperation= 2'b10;  funct=4'b1010; // less than  
	#10;
//testando para ALUop = 01 - para compare and branch (faz uma subtracao dos valores 
//e se for zero, seta a flag zero)
      ALUOperation= 2'b01;  funct=4'b0000; // SUB
	#10;
      ALUOperation= 2'b01;  funct=4'b0101; // SUB
	#10;
      ALUOperation= 2'b01;  funct=4'b0010; // SUB
	#10;
      ALUOperation= 2'b01;  funct=4'b0100; // SUB
	#10;
      ALUOperation= 2'b01;  funct=4'b1010; // SUB  
	#10;
    end
endmodule
