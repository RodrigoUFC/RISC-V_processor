library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        ALUControl      : in     vl_logic_vector(3 downto 0);
        readDataRegister1: in     vl_logic_vector(63 downto 0);
        inputSaidaMuxALUSrc: in     vl_logic_vector(63 downto 0);
        zeroFlag        : out    vl_logic;
        ALUResult       : out    vl_logic_vector(63 downto 0);
        carryFlag       : out    vl_logic;
        negativeFlag    : out    vl_logic;
        overflowFlag    : out    vl_logic
    );
end ALU;
