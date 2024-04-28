library verilog;
use verilog.vl_types.all;
entity dc_fifo_sm is
    port(
        aclr            : in     vl_logic;
        data            : in     vl_logic_vector(15 downto 0);
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0);
        rdempty         : out    vl_logic;
        rdfull          : out    vl_logic;
        rdusedw         : out    vl_logic_vector(11 downto 0);
        wrfull          : out    vl_logic
    );
end dc_fifo_sm;
