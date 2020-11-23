`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2018 15:00:54
// Design Name: 
// Module Name: tb_ALUControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ALUControl;
    reg[10:0] tb_Opcode;
    reg[1:0] tb_ALUOp;
    wire[3:0] tb_ALUControl;
     
     
      ALUControl DUT
    (
      .Opcode(tb_Opcode),
      .ALUControl(tb_ALUControl),
      .ALUOp(tb_ALUOp)
    );
    initial 
    begin   
        tb_ALUOp = 2'b10;
        tb_Opcode = 11'b10001011000; //ADD
        #10
        tb_ALUOp = 2'b10;
        tb_Opcode = 11'b11001011000; //SUB
        #10
        tb_ALUOp = 2'b10;
        tb_Opcode = 11'b10001010000; //AND
        #10
        tb_ALUOp = 2'b10;
        tb_Opcode = 11'b10101010000; //ORR
        #10
        tb_ALUOp = 2'b01; // Branch
        #10
        tb_ALUOp = 2'b00; // LDUR e STUR
        

    end 
    initial
    begin 
    $display("time \t Opcode ALUOp ALUControl");
    $monitor("%0t \t %b %b %b", $time, tb_Opcode, tb_ALUOp, tb_ALUControl);
    end

endmodule
