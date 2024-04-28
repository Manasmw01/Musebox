-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 13.1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2013 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_equalizer_rtl
-- VHDL created on Sun May 11 23:22:51 2014


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_equalizer_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(15 downto 0);
        enable_i : in std_logic_vector(0 downto 0);
        busIn_d : in std_logic_vector(15 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(15 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(29 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
    );
end fir_equalizer_rtl;

architecture normal of fir_equalizer_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";

    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_w_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_d_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rblookup_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rblookup_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_e : STD_LOGIC_VECTOR (0 downto 0);
    signal d_rblookup_h_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rm_reset0 : std_logic;
    signal rm_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal rm_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal rm_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal rm_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal rm_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_sc : SIGNED (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_wa0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_wa0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr0_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_delayr0_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_ca0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_ca0_eq : std_logic;
    signal u0_m0_wo0_dec0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_dec0_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_reset0 : std_logic;
    signal u0_m0_wo0_cm0_reset1 : std_logic;
    signal u0_m0_wo0_cm0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm0_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_cm0_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_cm0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_pr : SIGNED (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_a1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_b1 : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_replace_mem_reset0 : std_logic;
    signal d_xIn_0_14_replace_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_14_replace_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal d_xIn_0_14_replace_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal d_xIn_0_14_replace_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_14_replace_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_14_replace_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal d_xIn_0_14_replace_rdcnt_i : UNSIGNED (1 downto 0);
    signal d_xIn_0_14_replace_rdcnt_eq : std_logic;
    signal d_xIn_0_14_replace_rdreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal d_xIn_0_14_mem_top_q : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of d_xIn_0_14_sticky_ena_q : signal is true;
    signal input_valid_a : STD_LOGIC_VECTOR (0 downto 0);
    signal input_valid_b : STD_LOGIC_VECTOR (0 downto 0);
    signal input_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_not_write_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_not_write_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_read_hit_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_read_hit_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_read_hit_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_replace_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_replace_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal d_xIn_0_14_cmp_a : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_14_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rmPad_shift_q_int : STD_LOGIC_VECTOR (7 downto 0);
    signal rmPad_shift_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_in : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rmPad_bs_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rmPad_bs_b : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- busIn(BUSIN,4)@10

    -- d_busIn_d_11(DELAY,40)@10
    d_busIn_d_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => busIn_d, xout => d_busIn_d_11_q, clk => bus_clk, aclr => h_areset );

    -- rblookup(LOOKUP,6)@10
    rblookup: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_q <= "000000";
            rblookup_h <= "0";
            rblookup_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "000000000000" => rblookup_q <= "000000";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000001" => rblookup_q <= "000001";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000010" => rblookup_q <= "000010";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000011" => rblookup_q <= "000011";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000100" => rblookup_q <= "000100";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000101" => rblookup_q <= "000101";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000110" => rblookup_q <= "000110";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000000111" => rblookup_q <= "000111";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001000" => rblookup_q <= "001000";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001001" => rblookup_q <= "001001";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001010" => rblookup_q <= "001010";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001011" => rblookup_q <= "001011";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001100" => rblookup_q <= "001100";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001101" => rblookup_q <= "001101";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001110" => rblookup_q <= "001110";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000001111" => rblookup_q <= "001111";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010000" => rblookup_q <= "010000";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010001" => rblookup_q <= "010001";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010010" => rblookup_q <= "010010";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010011" => rblookup_q <= "010011";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010100" => rblookup_q <= "010100";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010101" => rblookup_q <= "010101";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010110" => rblookup_q <= "010110";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000010111" => rblookup_q <= "010111";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011000" => rblookup_q <= "011000";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011001" => rblookup_q <= "011001";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011010" => rblookup_q <= "011010";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011011" => rblookup_q <= "011011";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011100" => rblookup_q <= "011100";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011101" => rblookup_q <= "011101";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011110" => rblookup_q <= "011110";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000011111" => rblookup_q <= "011111";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000100000" => rblookup_q <= "100000";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000100001" => rblookup_q <= "100001";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000100010" => rblookup_q <= "100010";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000100011" => rblookup_q <= "100011";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN "000000100100" => rblookup_q <= "100100";
                                       rblookup_h <= "1";
                                       rblookup_e <= busIn_w;
                WHEN OTHERS => rblookup_q <= (others => '-');
                               rblookup_h <= "0";
                               rblookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- rm(DUALMEM,9)@11
    rm_ia <= STD_LOGIC_VECTOR(d_busIn_d_11_q(7 downto 0));
    rm_aa <= rblookup_q;
    rm_ab <= rblookup_q;
    rm_reset0 <= h_areset;
    rm_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 37,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 37,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "fir_equalizer_rtl_rm.hex",
        init_file_layout => "PORT_B",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => rblookup_e(0),
        aclr0 => rm_reset0,
        clock0 => bus_clk,
        address_b => rm_ab,
        q_b => rm_iq,
        address_a => rm_aa,
        data_a => rm_ia
    );
    rm_q <= rm_iq(7 downto 0);

    -- rmPad_shift(BITSHIFT,37)@13
    rmPad_shift_q_int <= STD_LOGIC_VECTOR(rm_q);
    rmPad_shift_q <= rmPad_shift_q_int(7 downto 0);

    -- rmPad_bs(BITSELECT,38)@13
    rmPad_bs_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 8 => rmPad_shift_q(7)) & rmPad_shift_q));
    rmPad_bs_b <= rmPad_bs_in(15 downto 0);

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_busIn_w_12(DELAY,41)@10
    d_busIn_w_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => busIn_w, xout => d_busIn_w_12_q, clk => bus_clk, aclr => h_areset );

    -- rblookup_not_write(LOGICAL,5)@12
    rblookup_not_write_a <= d_busIn_w_12_q;
    rblookup_not_write_q <= not (rblookup_not_write_a);

    -- d_rblookup_h_12(DELAY,42)@11
    d_rblookup_h_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rblookup_h, xout => d_rblookup_h_12_q, clk => bus_clk, aclr => h_areset );

    -- rblookup_read_hit(LOGICAL,7)@12
    rblookup_read_hit_a <= d_rblookup_h_12_q;
    rblookup_read_hit_b <= rblookup_not_write_q;
    rblookup_read_hit_q <= rblookup_read_hit_a and rblookup_read_hit_b;

    -- rblookup_valid(REG,8)@12
    rblookup_valid: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_valid_q <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            rblookup_valid_q <= STD_LOGIC_VECTOR(rblookup_read_hit_q);
        END IF;
    END PROCESS;

    -- busOut(BUSOUT,11)@13
    busOut_v <= rblookup_valid_q;
    busOut_r <= rmPad_bs_b;

    -- xIn(PORTIN,2)@10

    -- input_valid(LOGICAL,3)@10
    input_valid_a <= xIn_v;
    input_valid_b <= enable_i;
    input_valid_q <= input_valid_a and input_valid_b;

    -- u0_m0_wo0_run(ENABLEGENERATOR,14)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & input_valid_q & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(6 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(35, 7);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(6) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-36);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(6 downto 6));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q and VCC_q;

    -- u0_m0_wo0_memread(DELAY,15)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_15(DELAY,45)@12
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,29)@15
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "00000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 36;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_16(DELAY,46)@15
    d_u0_m0_wo0_compute_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_15_q, xout => d_u0_m0_wo0_compute_q_16_q, clk => clk, aclr => areset );

    -- d_xIn_0_14_notEnable(LOGICAL,55)
    d_xIn_0_14_notEnable_a <= VCC_q;
    d_xIn_0_14_notEnable_q <= not (d_xIn_0_14_notEnable_a);

    -- d_xIn_0_14_nor(LOGICAL,56)
    d_xIn_0_14_nor_a <= d_xIn_0_14_notEnable_q;
    d_xIn_0_14_nor_b <= d_xIn_0_14_sticky_ena_q;
    d_xIn_0_14_nor_q <= not (d_xIn_0_14_nor_a or d_xIn_0_14_nor_b);

    -- d_xIn_0_14_mem_top(CONSTANT,52)
    d_xIn_0_14_mem_top_q <= "010";

    -- d_xIn_0_14_cmp(LOGICAL,53)
    d_xIn_0_14_cmp_a <= d_xIn_0_14_mem_top_q;
    d_xIn_0_14_cmp_b <= STD_LOGIC_VECTOR("0" & d_xIn_0_14_replace_rdmux_q);
    d_xIn_0_14_cmp_q <= "1" WHEN d_xIn_0_14_cmp_a = d_xIn_0_14_cmp_b ELSE "0";

    -- d_xIn_0_14_cmpReg(REG,54)
    d_xIn_0_14_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_14_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_14_cmpReg_q <= STD_LOGIC_VECTOR(d_xIn_0_14_cmp_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_14_sticky_ena(REG,57)
    d_xIn_0_14_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_14_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_14_nor_q = "1") THEN
                d_xIn_0_14_sticky_ena_q <= STD_LOGIC_VECTOR(d_xIn_0_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_14_enaAnd(LOGICAL,58)
    d_xIn_0_14_enaAnd_a <= d_xIn_0_14_sticky_ena_q;
    d_xIn_0_14_enaAnd_b <= VCC_q;
    d_xIn_0_14_enaAnd_q <= d_xIn_0_14_enaAnd_a and d_xIn_0_14_enaAnd_b;

    -- d_xIn_0_14_replace_rdcnt(COUNTER,48)
    -- every=1, low=0, high=2, step=1, init=1
    d_xIn_0_14_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_14_replace_rdcnt_i <= TO_UNSIGNED(1, 2);
            d_xIn_0_14_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_14_replace_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                d_xIn_0_14_replace_rdcnt_eq <= '1';
            ELSE
                d_xIn_0_14_replace_rdcnt_eq <= '0';
            END IF;
            IF (d_xIn_0_14_replace_rdcnt_eq = '1') THEN
                d_xIn_0_14_replace_rdcnt_i <= d_xIn_0_14_replace_rdcnt_i - 2;
            ELSE
                d_xIn_0_14_replace_rdcnt_i <= d_xIn_0_14_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    d_xIn_0_14_replace_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_xIn_0_14_replace_rdcnt_i, 2)));

    -- d_xIn_0_14_replace_rdreg(REG,49)
    d_xIn_0_14_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_14_replace_rdreg_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_14_replace_rdreg_q <= STD_LOGIC_VECTOR(d_xIn_0_14_replace_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_14_replace_rdmux(MUX,50)
    d_xIn_0_14_replace_rdmux_s <= VCC_q;
    d_xIn_0_14_replace_rdmux: PROCESS (d_xIn_0_14_replace_rdmux_s, d_xIn_0_14_replace_rdreg_q, d_xIn_0_14_replace_rdcnt_q)
    BEGIN
        CASE (d_xIn_0_14_replace_rdmux_s) IS
            WHEN "0" => d_xIn_0_14_replace_rdmux_q <= d_xIn_0_14_replace_rdreg_q;
            WHEN "1" => d_xIn_0_14_replace_rdmux_q <= d_xIn_0_14_replace_rdcnt_q;
            WHEN OTHERS => d_xIn_0_14_replace_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- d_xIn_0_14_replace_mem(DUALMEM,47)
    d_xIn_0_14_replace_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    d_xIn_0_14_replace_mem_aa <= d_xIn_0_14_replace_rdreg_q;
    d_xIn_0_14_replace_mem_ab <= d_xIn_0_14_replace_rdmux_q;
    d_xIn_0_14_replace_mem_reset0 <= areset;
    d_xIn_0_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => d_xIn_0_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_0_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_xIn_0_14_replace_mem_ab,
        q_b => d_xIn_0_14_replace_mem_iq,
        address_a => d_xIn_0_14_replace_mem_aa,
        data_a => d_xIn_0_14_replace_mem_ia
    );
    d_xIn_0_14_replace_mem_q <= d_xIn_0_14_replace_mem_iq(15 downto 0);

    -- u0_m0_wo0_wi0_wa0(COUNTER,21)@14
    -- every=1, low=0, high=63, step=1, init=9
    u0_m0_wo0_wi0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa0_i <= TO_UNSIGNED(9, 6);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_14_q = "1") THEN
                u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa0_i, 6)));

    -- d_in0_m0_wi0_wo0_assign_sel_q_14(DELAY,43)@10
    d_in0_m0_wi0_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => input_valid_q, xout => d_in0_m0_wi0_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,44)@12
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_ra0_count1(COUNTER,18)@13
    -- every=1, low=0, high=63, step=1, init=0
    u0_m0_wo0_wi0_ra0_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count1_i <= TO_UNSIGNED(0, 6);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_ra0_count1_i <= u0_m0_wo0_wi0_ra0_count1_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count1_i, 7)));

    -- u0_m0_wo0_wi0_ra0_count0(COUNTER,17)@13
    -- every=37, low=0, high=63, step=28, init=37
    u0_m0_wo0_wi0_ra0_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count0_i <= TO_UNSIGNED(37, 6);
            u0_m0_wo0_wi0_ra0_count0_sc <= TO_SIGNED(35, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc - (-36);
                ELSE
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_i <= u0_m0_wo0_wi0_ra0_count0_i + 28;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count0_i, 7)));

    -- u0_m0_wo0_wi0_ra0_add_0_0(ADD,19)@13
    u0_m0_wo0_wi0_ra0_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count0_q);
    u0_m0_wo0_wi0_ra0_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count1_q);
    u0_m0_wo0_wi0_ra0_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_add_0_0_q <= u0_m0_wo0_wi0_ra0_add_0_0_o(7 downto 0);

    -- u0_m0_wo0_wi0_ra0_resize(BITSELECT,20)@14
    u0_m0_wo0_wi0_ra0_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_ra0_add_0_0_q(5 downto 0));
    u0_m0_wo0_wi0_ra0_resize_b <= u0_m0_wo0_wi0_ra0_resize_in(5 downto 0);

    -- u0_m0_wo0_wi0_delayr0(DUALMEM,22)@14
    u0_m0_wo0_wi0_delayr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_14_replace_mem_q);
    u0_m0_wo0_wi0_delayr0_aa <= u0_m0_wo0_wi0_wa0_q;
    u0_m0_wo0_wi0_delayr0_ab <= u0_m0_wo0_wi0_ra0_resize_b;
    u0_m0_wo0_wi0_delayr0_reset0 <= areset;
    u0_m0_wo0_wi0_delayr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 6,
        numwords_a => 64,
        width_b => 16,
        widthad_b => 6,
        numwords_b => 64,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0),
        aclr0 => u0_m0_wo0_wi0_delayr0_reset0,
        clock0 => clk,
        address_b => u0_m0_wo0_wi0_delayr0_ab,
        q_b => u0_m0_wo0_wi0_delayr0_iq,
        address_a => u0_m0_wo0_wi0_delayr0_aa,
        data_a => u0_m0_wo0_wi0_delayr0_ia
    );
    u0_m0_wo0_wi0_delayr0_q <= u0_m0_wo0_wi0_delayr0_iq(15 downto 0);

    -- u0_m0_wo0_dec0(LOOKUP,25)@10
    u0_m0_wo0_dec0: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec0_q <= "100100";
            u0_m0_wo0_dec0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "000000000000" => u0_m0_wo0_dec0_q <= "100100";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000001" => u0_m0_wo0_dec0_q <= "100011";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000010" => u0_m0_wo0_dec0_q <= "100010";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000011" => u0_m0_wo0_dec0_q <= "100001";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000100" => u0_m0_wo0_dec0_q <= "100000";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000101" => u0_m0_wo0_dec0_q <= "011111";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000110" => u0_m0_wo0_dec0_q <= "011110";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000000111" => u0_m0_wo0_dec0_q <= "011101";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001000" => u0_m0_wo0_dec0_q <= "011100";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001001" => u0_m0_wo0_dec0_q <= "011011";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001010" => u0_m0_wo0_dec0_q <= "011010";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001011" => u0_m0_wo0_dec0_q <= "011001";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001100" => u0_m0_wo0_dec0_q <= "011000";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001101" => u0_m0_wo0_dec0_q <= "010111";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001110" => u0_m0_wo0_dec0_q <= "010110";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000001111" => u0_m0_wo0_dec0_q <= "010101";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010000" => u0_m0_wo0_dec0_q <= "010100";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010001" => u0_m0_wo0_dec0_q <= "010011";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010010" => u0_m0_wo0_dec0_q <= "010010";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010011" => u0_m0_wo0_dec0_q <= "010001";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010100" => u0_m0_wo0_dec0_q <= "010000";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010101" => u0_m0_wo0_dec0_q <= "001111";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010110" => u0_m0_wo0_dec0_q <= "001110";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000010111" => u0_m0_wo0_dec0_q <= "001101";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011000" => u0_m0_wo0_dec0_q <= "001100";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011001" => u0_m0_wo0_dec0_q <= "001011";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011010" => u0_m0_wo0_dec0_q <= "001010";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011011" => u0_m0_wo0_dec0_q <= "001001";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011100" => u0_m0_wo0_dec0_q <= "001000";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011101" => u0_m0_wo0_dec0_q <= "000111";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011110" => u0_m0_wo0_dec0_q <= "000110";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000011111" => u0_m0_wo0_dec0_q <= "000101";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000100000" => u0_m0_wo0_dec0_q <= "000100";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000100001" => u0_m0_wo0_dec0_q <= "000011";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000100010" => u0_m0_wo0_dec0_q <= "000010";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000100011" => u0_m0_wo0_dec0_q <= "000001";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN "000000100100" => u0_m0_wo0_dec0_q <= "000000";
                                       u0_m0_wo0_dec0_e <= busIn_w;
                WHEN OTHERS => u0_m0_wo0_dec0_q <= (others => '-');
                               u0_m0_wo0_dec0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_ca0(COUNTER,24)@12
    -- every=1, low=0, high=36, step=1, init=0
    u0_m0_wo0_ca0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca0_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_ca0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca0_i = TO_UNSIGNED(35, 6)) THEN
                    u0_m0_wo0_ca0_eq <= '1';
                ELSE
                    u0_m0_wo0_ca0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca0_eq = '1') THEN
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i - 36;
                ELSE
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca0_i, 6)));

    -- u0_m0_wo0_cm0(DUALMEM,27)@12
    u0_m0_wo0_cm0_ia <= STD_LOGIC_VECTOR(d_busIn_d_11_q(7 downto 0));
    u0_m0_wo0_cm0_aa <= u0_m0_wo0_dec0_q;
    u0_m0_wo0_cm0_ab <= u0_m0_wo0_ca0_q;
    u0_m0_wo0_cm0_reset1 <= areset;
    u0_m0_wo0_cm0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 64,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 64,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "fir_equalizer_rtl_u0_m0_wo0_cm0.hex",
        init_file_layout => "PORT_B",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_m0_wo0_dec0_e(0),
        clock0 => bus_clk,
        aclr1 => u0_m0_wo0_cm0_reset1,
        clock1 => clk,
        address_b => u0_m0_wo0_cm0_ab,
        q_b => u0_m0_wo0_cm0_iq,
        address_a => u0_m0_wo0_cm0_aa,
        data_a => u0_m0_wo0_cm0_ia
    );
    u0_m0_wo0_cm0_q <= u0_m0_wo0_cm0_iq(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_0(MULT,28)@14
    u0_m0_wo0_mtree_mult1_0_pr <= SIGNED(SIGNED(u0_m0_wo0_mtree_mult1_0_a0) * SIGNED(u0_m0_wo0_mtree_mult1_0_b0));
    u0_m0_wo0_mtree_mult1_0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_a0 <= (others => '0');
            u0_m0_wo0_mtree_mult1_0_b0 <= (others => '0');
            u0_m0_wo0_mtree_mult1_0_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
            u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_delayr0_q);
            u0_m0_wo0_mtree_mult1_0_s1 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_pr);
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_accum(ADD,30)@16
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 24 => u0_m0_wo0_mtree_mult1_0_q(23)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_a1 <= u0_m0_wo0_accum_i;
    u0_m0_wo0_accum_b1 <= (others => '0') WHEN u0_m0_wo0_aseq_q = "1" ELSE u0_m0_wo0_accum_b;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_16_q = "1") THEN
                u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a1) + SIGNED(u0_m0_wo0_accum_b1));
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(29 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,31)@15
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00100100";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "00000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 36;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,32)@16
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_16_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,33)@16
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,36)@17
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
