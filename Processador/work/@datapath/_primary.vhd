library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        instructionAddress: in     vl_logic_vector(63 downto 0);
        clk             : in     vl_logic
    );
end Datapath;
