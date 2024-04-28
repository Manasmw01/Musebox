library verilog;
use verilog.vl_types.all;
entity signal_tap is
    port(
        acq_clk         : in     vl_logic;
        acq_data_in     : in     vl_logic_vector(31 downto 0);
        acq_trigger_in  : in     vl_logic_vector(0 downto 0)
    );
end signal_tap;
