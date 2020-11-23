library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        opcode          : out    vl_logic_vector(10 downto 0);
        rm              : out    vl_logic_vector(4 downto 0);
        shamt           : out    vl_logic_vector(5 downto 0);
        rn              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        address         : out    vl_logic_vector(18 downto 0)
    );
end decoder;
