library verilog;
use verilog.vl_types.all;
entity add_signed is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        sum             : out    vl_logic_vector(6 downto 0)
    );
end add_signed;
