//altshift_taps CBX_SINGLE_OUTPUT_FILE="ON" INTENDED_DEVICE_FAMILY=""Cyclone V"" LPM_HINT="RAM_BLOCK_TYPE=AUTO" LPM_TYPE="altshift_taps" NUMBER_OF_TAPS=16384 TAP_DISTANCE=1 WIDTH=16 clken clock shiftin shiftout taps
//VERSION_BEGIN 13.1 cbx_mgl 2013:11:26:18:36:02:SJ cbx_stratixii 2013:11:26:18:07:45:SJ cbx_util_mgl 2013:11:26:18:07:45:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = altshift_taps 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgmpj
	( 
	clken,
	clock,
	shiftin,
	shiftout,
	taps) /* synthesis synthesis_clearbox=1 */;
	input   clken;
	input   clock;
	input   [15:0]  shiftin;
	output   [15:0]  shiftout;
	output   [262143:0]  taps;

	wire  [15:0]   wire_mgl_prim1_shiftout;
	wire  [262143:0]   wire_mgl_prim1_taps;

	altshift_taps   mgl_prim1
	( 
	.clken(clken),
	.clock(clock),
	.shiftin(shiftin),
	.shiftout(wire_mgl_prim1_shiftout),
	.taps(wire_mgl_prim1_taps));
	defparam
		mgl_prim1.intended_device_family = ""Cyclone V"",
		mgl_prim1.lpm_type = "altshift_taps",
		mgl_prim1.number_of_taps = 16384,
		mgl_prim1.tap_distance = 1,
		mgl_prim1.width = 16,
		mgl_prim1.lpm_hint = "RAM_BLOCK_TYPE=AUTO";
	assign
		shiftout = wire_mgl_prim1_shiftout,
		taps = wire_mgl_prim1_taps;
endmodule //mgmpj
//VALID FILE
