/*
	Unsigned 
*/

//////////////////////////////////
// 32to64bit Sign Extender Unit Structure & Logic Modules
//////////////////////////////////

module Sign_Extend (In, Out);
  input[31:0] In;
  output[63:0] Out;
  
  reg[63:0] Out;

  always @(In) begin
	if (In[31:23] == 9'b001110000) // LDUR or STUR
		begin
			if(In[20])
				begin
					Out[8:0] <= In[20:12];
					Out[63:9] <= {55{1'b1}};
				end
			else
				begin 
					Out[8:0] <= In[20:12];
			        Out[63:9] <= {55{1'b0}};
				end
		end
	else
		begin
			if(In[31:25] == 7'b1011010 || In[31:24] == 8'b01010100) // CBZ, or CBNZ
				begin
					if(In[24])
						begin
							Out[18:0] <= In[24:5];
							Out[63:19] <= {45{1'b1}};
						end
					else
						begin 
							Out[18:0] <= In[24:10];
							Out[63:19] <= {45{1'b0}};
						end
				end
			else
				if(In[31:22] == 10'b1001000100) // ADDI
					begin
						if(In[21])
							begin
								Out[11:0] <= In[21:10];
								Out[63:12] <= {52{1'b1}};
							end
						else
							begin 
								Out[11:0] <= In[21:10];
								Out[63:12] <= {52{1'b0}};
							end
					end
				else
					begin
						if(In[31:26] == 6'b000101) // B
							begin
								if(In[25])
									begin
										Out[25:0] <= In[25:0];
										Out[63:26] <= {38{1'b1}};
									end
								else
									begin 
										Out[25:0] <= In[25:0];
										Out[63:26] <= {38{1'b0}};
									end
							end
					end
		end
	end
endmodule

//LDUR, STUR - Address: |20:12| 9bits
//CBZ, CBNZ, B.cnd - Addresss: |23:5| 19bits
//B - Address: |25:0| 26bits 