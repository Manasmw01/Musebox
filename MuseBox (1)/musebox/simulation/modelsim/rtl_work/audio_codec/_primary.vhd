library verilog;
use verilog.vl_types.all;
entity audio_codec is
    generic(
        SINE            : integer := 0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sample_end      : out    vl_logic_vector(1 downto 0);
        sample_req      : out    vl_logic_vector(1 downto 0);
        audio_output_l  : in     vl_logic_vector(15 downto 0);
        audio_output_r  : in     vl_logic_vector(15 downto 0);
        audio_input_l   : out    vl_logic_vector(15 downto 0);
        audio_input_r   : out    vl_logic_vector(15 downto 0);
        channel_sel     : in     vl_logic_vector(1 downto 0);
        AUD_ADCLRCK     : out    vl_logic;
        AUD_ADCDAT      : in     vl_logic;
        AUD_DACLRCK     : out    vl_logic;
        AUD_DACDAT      : out    vl_logic;
        AUD_BCLK        : out    vl_logic;
        control         : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SINE : constant is 1;
end audio_codec;
