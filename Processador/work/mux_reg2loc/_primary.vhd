library verilog;
use verilog.vl_types.all;
entity mux_reg2loc is
    port(
        Instruction20to16: in     vl_logic_vector(4 downto 0);
        Instruction4to0 : in     vl_logic_vector(4 downto 0);
        Reg2Loc         : in     vl_logic;
        ReadRegister2   : out    vl_logic_vector(4 downto 0)
    );
end mux_reg2loc;
