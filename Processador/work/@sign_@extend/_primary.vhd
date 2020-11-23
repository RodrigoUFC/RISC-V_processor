library verilog;
use verilog.vl_types.all;
entity Sign_Extend is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        extendedInstruction: out    vl_logic_vector(63 downto 0)
    );
end Sign_Extend;
