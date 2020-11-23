module ALUcontrol (ALUoperation, funct, ALUcontrol);
  input [1:0]ALUoperation;
  input [5:0]funct;
  output reg [3:0] ALUcontrol;

  always @(ALUoperation, funct) begin
    if (ALUoperation == 2'b00) ALUcontrol = 4'b0010; // load word - store word (soma o endereco da memoria)
    if (ALUoperation == 2'b01) ALUcontrol = 4'b0110; // branch equal (subtrai os valores para ver se vai da igual a zero)
    if (ALUoperation == 2'b10) begin
        case (funct[3:0])
          4'b0000:
            ALUcontrol = 4'b0010; // add
          4'b0010:
            ALUcontrol = 4'b0110; // subtract
          4'b0100:
            ALUcontrol = 4'b0000; // AND
          4'b0101:
            ALUcontrol = 4'b0001; // OR
          4'b1010:
            ALUcontrol = 4'b0111; // EOR
    default:
      ALUcontrol = 4'b1111; //não é para acontecer
        endcase
      end
  end
endmodule //ALUcontrol
