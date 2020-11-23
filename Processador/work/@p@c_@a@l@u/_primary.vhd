library verilog;
use verilog.vl_types.all;
entity PC_ALU is
    port(
        actualPC        : in     vl_logic_vector(63 downto 0);
        nextPC          : out    vl_logic_vector(63 downto 0)
    );
end PC_ALU;
