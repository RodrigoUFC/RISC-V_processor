library verilog;
use verilog.vl_types.all;
entity PCShiftAdder is
    port(
        actualPC        : in     vl_logic_vector(63 downto 0);
        shiftedBranchAddress: in     vl_logic_vector(63 downto 0);
        branchAdress    : out    vl_logic_vector(63 downto 0)
    );
end PCShiftAdder;
