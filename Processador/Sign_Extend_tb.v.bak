`include "Sign_Extend.v"

module Sign_Extend_tb; 
  reg[31:0] In;
  
  wire[63:0] Out;
  
  Sign_Extend Extender_1(In, Out); 

  initial
   begin
	In <= {11'b11111000000, 9'b011111111, 12'b00}; //LDUR Addr: #255 onde 9' eh o address
	#5
	In <= {11'b11111000000, 9'b111111111, 12'b00}; //LDUR Addr: #511 onde 9' eh o address
	#5
    	In <= {11'b00111000010, 9'b000000101, 12'b101010101010}; //LDUR Addr: #5 - Esse ta dando errado (nao sei pq)
   	#5
    	In <= {11'b00111000010, 9'b000001000, 12'b101010101010}; //LDUR Addr: #8 - Esse ta dando errado (nao sei pq)
    	#5
    	In <= {8'b10110100, 19'b1010111110000010000, 5'b0}; //CBZ Addr: 111110000010000 (19' address) (a saida contendo varios 1)
    	#5
	In <= {6'b000101, 20'b00001000001101001110, 6'b0}; //B.cnd Addr eh o 20' e 6' com a saida tendo varios 0
	#5
	In <= {6'b000101, 20'b10001000001101001110, 6'b0}; //B.cnd Addr eh o 20' e 6' com a saida tendo varios 1
	#5
	In <= {10'b1001000100, 6'b000101, 16'b0001110100101010}; //ADDI com no de 64 sendo varios 0
	#5
	In <= {10'b1001000100, 6'b000101, 16'b1001110100101010}; //ADDI com no de 64 sendo varios 1
   end
  initial
   begin
      $monitor("time=%4d : In = %b : Out = %b", $time, In, Out);
   end
endmodule