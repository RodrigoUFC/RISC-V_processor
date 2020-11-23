library verilog;
use verilog.vl_types.all;
entity ALUControl is
    port(
        Opcode          : in     vl_logic_vector(10 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUControl      : out    vl_logic_vector(3 downto 0)
    );
end ALUControl;
