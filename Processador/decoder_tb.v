module testbench_instruction_decoder();
    reg[31:0] instruction;  //entrada da instrução (saída do bloco de instruction memory)

    wire[10:0] opcode;      //qual operação será realizada 11 bits
    wire[4:0] rm;       //o segundo registrador da ?fonte?
    wire[5:0] shamt;        //quantidade de shift
    wire[4:0] rn;           //o primeiro registrador da ?fonte?
    wire[4:0] rt;           //rd no livro, o registrador de destino
    wire[18:0] address;     //não sei pq isso tem 19 bits
    decoder unidade (instruction, opcode, rm, shamt, rn, rt, address);
    initial
        begin
        $monitor("%0t \t %b %b ", $time, instruction, opcode, rm, shamt, rn, rt, address);
        instruction = 32'b10110100000000111000001000100110; //CBZ
            #10
        instruction = 32'b10110001000000000010000000100000; //ADDIS
            #10
        instruction = 32'b11110001000000000010000000100000; //SUBIS
            #10
        instruction = 32'b10101011000000100000000000100000; //ADDS
            #10
        instruction = 32'b11101011000000000010000000100000; //SUBS
            #10
        instruction = 32'b10001011000000100000000000100000; //AND
            #10
        instruction = 32'b11111000000000100000000000100000; //STUR
            #10
        instruction = 32'b11111000010000100000000000100000; //LDUR
            #10
        instruction = 32'b11111000010000001000000000100000; //PC = 28
            #10
        instruction = 32'b11111000000000010000000000100000; //PC = 32
            #10
        instruction = 32'b10110100000000000000000001000001; //PC = 36
            #10
        instruction = 32'b00010100000000000000000000000010; //PC = 40
        #10
        instruction = 32'b11101011000000000000000000000010; //PC = 44 ADDS
    end
endmodule