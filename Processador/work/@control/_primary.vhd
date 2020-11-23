library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        Opcode          : in     vl_logic_vector(10 downto 0);
        Reg2Loc         : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end Control;
