module instruction_memory_tb();
reg[63:0] instructionAddress_tb;
reg clk_tb;
wire[31:0] instruction_tb;
instruction_memory DUT (.instructionAddress(instructionAddress_tb),.clk(clk_tb),.instruction(instruction_tb));
initial
    begin
    $monitor("%0t \t %b %b ", $time, instructionAddress_tb, instruction_tb);
    clk_tb = 1'b0;
    #1;
    instructionAddress_tb = 64'b0;
    clk_tb = 1'b1;
    #5;
    instructionAddress_tb = 64'b100;
    #5;
    instructionAddress_tb = 64'b1000;
    #5;
    instructionAddress_tb = 64'b1100;
    #5;
    end
    always #4 clk_tb = ~clk_tb;
endmodule