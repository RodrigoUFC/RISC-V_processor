library verilog;
use verilog.vl_types.all;
entity mux_Branch is
    port(
        AdderOut        : in     vl_logic_vector(11 downto 0);
        AddALUOut       : in     vl_logic_vector(11 downto 0);
        \Select\        : in     vl_logic;
        PC              : out    vl_logic_vector(11 downto 0)
    );
end mux_Branch;
