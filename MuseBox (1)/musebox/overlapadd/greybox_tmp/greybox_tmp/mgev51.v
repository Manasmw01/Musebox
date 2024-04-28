//dcfifo CBX_SINGLE_OUTPUT_FILE="ON" CLOCKS_ARE_SYNCHRONIZED="FALSE" INTENDED_DEVICE_FAMILY=""Cyclone V"" LPM_NUMWORDS=2048 LPM_SHOWAHEAD="ON" LPM_TYPE="dcfifo" LPM_WIDTH=16 LPM_WIDTHU=11 OVERFLOW_CHECKING="ON" RDSYNC_DELAYPIPE=4 READ_ACLR_SYNCH="ON" UNDERFLOW_CHECKING="ON" USE_EAB="OFF" WRITE_ACLR_SYNCH="OFF" WRSYNC_DELAYPIPE=4 aclr data q rdclk rdempty rdfull rdreq rdusedw wrclk wrempty wrfull wrreq wrusedw
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



//synthesis_resources = dcfifo 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgev51
	( 
	aclr,
	data,
	q,
	rdclk,
	rdempty,
	rdfull,
	rdreq,
	rdusedw,
	wrclk,
	wrempty,
	wrfull,
	wrreq,
	wrusedw) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   [15:0]  data;
	output   [15:0]  q;
	input   rdclk;
	output   rdempty;
	output   rdfull;
	input   rdreq;
	output   [10:0]  rdusedw;
	input   wrclk;
	output   wrempty;
	output   wrfull;
	input   wrreq;
	output   [10:0]  wrusedw;

	wire  [15:0]   wire_mgl_prim1_q;
	wire  wire_mgl_prim1_rdempty;
	wire  wire_mgl_prim1_rdfull;
	wire  [10:0]   wire_mgl_prim1_rdusedw;
	wire  wire_mgl_prim1_wrempty;
	wire  wire_mgl_prim1_wrfull;
	wire  [10:0]   wire_mgl_prim1_wrusedw;

	dcfifo   mgl_prim1
	( 
	.aclr(aclr),
	.data(data),
	.q(wire_mgl_prim1_q),
	.rdclk(rdclk),
	.rdempty(wire_mgl_prim1_rdempty),
	.rdfull(wire_mgl_prim1_rdfull),
	.rdreq(rdreq),
	.rdusedw(wire_mgl_prim1_rdusedw),
	.wrclk(wrclk),
	.wrempty(wire_mgl_prim1_wrempty),
	.wrfull(wire_mgl_prim1_wrfull),
	.wrreq(wrreq),
	.wrusedw(wire_mgl_prim1_wrusedw));
	defparam
		mgl_prim1.clocks_are_synchronized = "FALSE",
		mgl_prim1.intended_device_family = ""Cyclone V"",
		mgl_prim1.lpm_numwords = 2048,
		mgl_prim1.lpm_showahead = "ON",
		mgl_prim1.lpm_type = "dcfifo",
		mgl_prim1.lpm_width = 16,
		mgl_prim1.lpm_widthu = 11,
		mgl_prim1.overflow_checking = "ON",
		mgl_prim1.rdsync_delaypipe = 4,
		mgl_prim1.read_aclr_synch = "ON",
		mgl_prim1.underflow_checking = "ON",
		mgl_prim1.use_eab = "OFF",
		mgl_prim1.write_aclr_synch = "OFF",
		mgl_prim1.wrsync_delaypipe = 4;
	assign
		q = wire_mgl_prim1_q,
		rdempty = wire_mgl_prim1_rdempty,
		rdfull = wire_mgl_prim1_rdfull,
		rdusedw = wire_mgl_prim1_rdusedw,
		wrempty = wire_mgl_prim1_wrempty,
		wrfull = wire_mgl_prim1_wrfull,
		wrusedw = wire_mgl_prim1_wrusedw;
endmodule //mgev51
//VALID FILE
