library verilog;
use verilog.vl_types.all;
entity mux_ALUSrc is
    port(
        ReadData2       : in     vl_logic_vector(63 downto 0);
        Instruction31to0Extended: in     vl_logic_vector(63 downto 0);
        ALUSrc          : in     vl_logic;
        \Out\           : out    vl_logic_vector(63 downto 0)
    );
end mux_ALUSrc;
