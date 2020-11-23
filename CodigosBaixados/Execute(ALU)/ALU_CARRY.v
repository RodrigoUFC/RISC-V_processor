module ALU_CARRY (A, B, zero, negative,carry, ALUresult, ALUcontrol);
  output zero;
  output negative;
  output reg [1:0]carry;
  //output reg [1:0]overflow;
  output reg [63:0]ALUresult;
  input [63:0]A;
  input [63:0]B;
  input [3:0] ALUcontrol;
  reg [63:0] temp;

  assign zero = (ALUresult == 0);
  assign negative = (ALUresult[63:62] == 1);

  always @(A or B or ALUcontrol) begin
    case (ALUcontrol)
      4'b0000: //AND
        ALUresult = A & B;
      4'b0001: //OR
        ALUresult = A | B;
      4'b0010: //ADDS
	//if ( A[63:62] == 0 && B[63:62] == 0  && temp[63:62]  == 1 )
    	 // begin 
      	 //   overflow = 1;
    	 // end 
        if( A+B > 64'hFFFFFFFF)
	//Result is greater than 64 bits (carry recebe um bit)
	  begin 
       	    ALUresult <= temp[63:0];
	    carry = 1;
          end
	else
	  begin
            ALUresult = A + B;
	    carry = 0;
	end
      4'b0110: //SUBS
	if( A-B > 63'hFFFFFFFF)
	//Result is greater than 64 bits
		begin 
			temp = A-B;
       			ALUresult <= temp[63:0];
			carry = 1;
        	end
	else
		begin
          		ALUresult = A - B;
	  		carry = 0;
		end
      4'b0111: // EOR
        ALUresult = A^B; 
    endcase
  end
endmodule
