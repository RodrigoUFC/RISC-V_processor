module decoder (instruction, opcode, rm, shamt, rn, rt, address);
    input[31:0] instruction;    //entrada da instrução (saída do bloco de instruction memory)

    output reg [10:0] opcode;       //qual operação será realizada 11 bits
    output reg [4:0] rm;        //o segundo registrador da ?fonte?
    output reg [5:0] shamt;         //quantidade de shift
    output reg [4:0] rn;            //o primeiro registrador da ?fonte?
    output reg [4:0] rt;            //rd no livro, o registrador de destino
    output reg [18:0] address;      //não sei pq isso tem 19 bits




/*PARA INSTRUÇÕES TYPE R

opcode = instruction[31:21];
rm = instruction[20:16];
shamt = instruction[15:10];
rn = instruction[9:4];
rt = instruction[4:0];

PARA INSTRUÇÕES TYPE I

opcode = instruction[31:22];
address = instruction[21:10];   //immediate (foi utilizada a saida de address)
rn = instruction[9:5];
rt = instruction[4:0];

PARA INSTRUÇÕES TYPE D

opcode = instruction[31:21];
address = instruction[20:10];
rn = instruction[9:5];
rt = instruction[4:0];

PARA INSTRUÇÕES CONDITIONAL BRANCH



*/


always @(*)
begin

//CONDITIONAL BRANCH
//IMMEDIATE
//TYPE-D & TYPE-R

  if(instruction[31:24] == 8'b10110100)  //CBZ (8bit opcode+19bit address+5bit rt)
  begin
    opcode = instruction[31:24];
    address = instruction[23:5];
    rt = instruction[4:0];
  end
  else
    begin
      if(instruction[31:22] == 10'b1011000100 |instruction[31:22] == 10'b1111000100) //IMMEDIATE (10bit opcode+12bit immediate+5bit rn+5bit rt)
      begin
        opcode = instruction[31:22];
        address = instruction[21:10];   //immediate
        rn = instruction[9:5];
        rt = instruction[4:0];
      end
      else
      begin
        if(instruction[31:21] == 11'b11111000010 |instruction[31:21] == 11'b11111000000)    //LOAD OU STORE (11bit opcode+(9bit address + 2bit op2)+5bit rn + 5bit rt)
        begin
          opcode = instruction[31:21];
          address = instruction[20:10];
          rn = instruction[9:5];
          rt = instruction[4:0];
        end
        else                    // senão será R-TYPE (11bit opcode + 5bit rm+6bit shamt+5bit rn+5bit rt)
        begin
          opcode = instruction[31:21];
          rm = instruction[20:16];
          shamt = instruction[15:10];
          rn = instruction[9:5];
          rt = instruction[4:0];
        end
      end
    end
  end
endmodule