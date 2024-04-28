library verilog;
use verilog.vl_types.all;
entity clock_pll is
    port(
        locked          : out    vl_logic;
        outclk_0        : out    vl_logic;
        outclk_1        : out    vl_logic;
        refclk          : in     vl_logic;
        rst             : in     vl_logic
    );
end clock_pll;
