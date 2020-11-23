library verilog;
use verilog.vl_types.all;
entity mux_MemtoReg is
    port(
        ReadData        : in     vl_logic_vector(63 downto 0);
        ALUResult       : in     vl_logic_vector(63 downto 0);
        MemtoRead       : in     vl_logic;
        WriteData       : out    vl_logic_vector(63 downto 0)
    );
end mux_MemtoReg;
