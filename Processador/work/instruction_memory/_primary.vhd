library verilog;
use verilog.vl_types.all;
entity instruction_memory is
    port(
        instructionAddress: in     vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end instruction_memory;
