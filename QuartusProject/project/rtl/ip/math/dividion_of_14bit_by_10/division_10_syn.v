// megafunction wizard: %LPM_DIVIDE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_DIVIDE 

// ============================================================
// File Name: division_10.v
// Megafunction Name(s):
// 			LPM_DIVIDE
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 22.1std.2 Build 922 07/20/2023 SC Lite Edition
// ************************************************************


//Copyright (C) 2023  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and any partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details, at
//https://fpgasoftware.intel.com/eula.


//lpm_divide DEVICE_FAMILY="Cyclone IV E" LPM_DREPRESENTATION="UNSIGNED" LPM_NREPRESENTATION="UNSIGNED" LPM_PIPELINE=1 LPM_REMAINDERPOSITIVE="TRUE" LPM_WIDTHD=4 LPM_WIDTHN=14 aclr clock denom numer quotient remain
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_abs 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_lpm_divide 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC cbx_util_mgl 2023:07:21:07:12:21:SC  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//sign_div_unsign DEN_REPRESENTATION="UNSIGNED" DEN_WIDTH=4 LPM_PIPELINE=1 MAXIMIZE_SPEED=5 NUM_REPRESENTATION="UNSIGNED" NUM_WIDTH=14 SKIP_BITS=0 aclr clock denominator numerator quotient remainder
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_abs 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_lpm_divide 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC cbx_util_mgl 2023:07:21:07:12:21:SC  VERSION_END


//alt_u_div DEVICE_FAMILY="Cyclone IV E" LPM_PIPELINE=1 MAXIMIZE_SPEED=5 SKIP_BITS=0 WIDTH_D=4 WIDTH_N=14 WIDTH_Q=14 WIDTH_R=4 aclr clock denominator numerator quotient remainder
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_abs 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_lpm_divide 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC cbx_util_mgl 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=1 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  division_10_add_sub
	( 
	cout,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	output   cout;
	input   [0:0]  dataa;
	input   [0:0]  datab;
	output   [0:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [0:0]  dataa;
	tri0   [0:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  carry_eqn;
	wire  cin_wire;
	wire  [0:0]  datab_node;
	wire  [0:0]  sum_eqn;

	assign
		carry_eqn = {((dataa[0] & datab_node[0]) | ((dataa[0] | datab_node[0]) & cin_wire))},
		cin_wire = 1'b1,
		cout = carry_eqn[0],
		datab_node = (~ datab),
		result = sum_eqn,
		sum_eqn = {((dataa[0] ^ datab_node[0]) ^ cin_wire)};
endmodule //division_10_add_sub


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=2 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  division_10_add_sub1
	( 
	cout,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	output   cout;
	input   [1:0]  dataa;
	input   [1:0]  datab;
	output   [1:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  dataa;
	tri0   [1:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [1:0]  carry_eqn;
	wire  cin_wire;
	wire  [1:0]  datab_node;
	wire  [1:0]  sum_eqn;

	assign
		carry_eqn = {((dataa[1] & datab_node[1]) | ((dataa[1] | datab_node[1]) & carry_eqn[0])), ((dataa[0] & datab_node[0]) | ((dataa[0] | datab_node[0]) & cin_wire))},
		cin_wire = 1'b1,
		cout = carry_eqn[1],
		datab_node = (~ datab),
		result = sum_eqn,
		sum_eqn = {((dataa[1] ^ datab_node[1]) ^ carry_eqn[0]), ((dataa[0] ^ datab_node[0]) ^ cin_wire)};
endmodule //division_10_add_sub1


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=3 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=4 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END


//lpm_add_sub DEVICE_FAMILY="Cyclone IV E" LPM_DIRECTION="SUB" LPM_WIDTH=5 cout dataa datab result
//VERSION_BEGIN 22.1 cbx_cycloneii 2023:07:21:07:12:21:SC cbx_lpm_add_sub 2023:07:21:07:12:21:SC cbx_mgl 2023:07:21:07:12:36:SC cbx_nadder 2023:07:21:07:12:21:SC cbx_stratix 2023:07:21:07:12:21:SC cbx_stratixii 2023:07:21:07:12:21:SC  VERSION_END

//synthesis_resources = lut 69 reg 37 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"{-to DFFQuotient[0]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[1]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[2]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[3]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[4]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[5]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[6]} POWER_UP_LEVEL=HIGH;{-to DFFQuotient[7]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[8]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[9]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[10]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[11]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[12]} POWER_UP_LEVEL=LOW;{-to DFFQuotient[13]} POWER_UP_LEVEL=LOW"} *)
module  division_10_alt_u_div
	( 
	aclr,
	clock,
	denominator,
	numerator,
	quotient,
	remainder) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   [3:0]  denominator;
	input   [13:0]  numerator;
	output   [13:0]  quotient;
	output   [3:0]  remainder;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	[3:0]	DFFDenominator;
	reg	[13:0]	DFFNumerator;
	wire	[13:0]	wire_DFFQuotient_d;
	reg	[13:0]	DFFQuotient;
	reg	[4:0]	DFFStage;
	wire  wire_add_sub_0_cout;
	wire  [0:0]   wire_add_sub_0_result;
	wire  wire_add_sub_1_cout;
	wire  [1:0]   wire_add_sub_1_result;
	wire	[5:0]	wire_add_sub_10_result_int;
	wire	wire_add_sub_10_cout;
	wire	[4:0]	wire_add_sub_10_dataa;
	wire	[4:0]	wire_add_sub_10_datab;
	wire	[4:0]	wire_add_sub_10_result;
	wire	[5:0]	wire_add_sub_11_result_int;
	wire	wire_add_sub_11_cout;
	wire	[4:0]	wire_add_sub_11_dataa;
	wire	[4:0]	wire_add_sub_11_datab;
	wire	[4:0]	wire_add_sub_11_result;
	wire	[5:0]	wire_add_sub_12_result_int;
	wire	wire_add_sub_12_cout;
	wire	[4:0]	wire_add_sub_12_dataa;
	wire	[4:0]	wire_add_sub_12_datab;
	wire	[4:0]	wire_add_sub_12_result;
	wire	[5:0]	wire_add_sub_13_result_int;
	wire	wire_add_sub_13_cout;
	wire	[4:0]	wire_add_sub_13_dataa;
	wire	[4:0]	wire_add_sub_13_datab;
	wire	[4:0]	wire_add_sub_13_result;
	wire	[3:0]	wire_add_sub_2_result_int;
	wire	wire_add_sub_2_cout;
	wire	[2:0]	wire_add_sub_2_dataa;
	wire	[2:0]	wire_add_sub_2_datab;
	wire	[2:0]	wire_add_sub_2_result;
	wire	[4:0]	wire_add_sub_3_result_int;
	wire	wire_add_sub_3_cout;
	wire	[3:0]	wire_add_sub_3_dataa;
	wire	[3:0]	wire_add_sub_3_datab;
	wire	[3:0]	wire_add_sub_3_result;
	wire	[5:0]	wire_add_sub_4_result_int;
	wire	wire_add_sub_4_cout;
	wire	[4:0]	wire_add_sub_4_dataa;
	wire	[4:0]	wire_add_sub_4_datab;
	wire	[4:0]	wire_add_sub_4_result;
	wire	[5:0]	wire_add_sub_5_result_int;
	wire	wire_add_sub_5_cout;
	wire	[4:0]	wire_add_sub_5_dataa;
	wire	[4:0]	wire_add_sub_5_datab;
	wire	[4:0]	wire_add_sub_5_result;
	wire	[5:0]	wire_add_sub_6_result_int;
	wire	wire_add_sub_6_cout;
	wire	[4:0]	wire_add_sub_6_dataa;
	wire	[4:0]	wire_add_sub_6_datab;
	wire	[4:0]	wire_add_sub_6_result;
	wire	[5:0]	wire_add_sub_7_result_int;
	wire	wire_add_sub_7_cout;
	wire	[4:0]	wire_add_sub_7_dataa;
	wire	[4:0]	wire_add_sub_7_datab;
	wire	[4:0]	wire_add_sub_7_result;
	wire	[5:0]	wire_add_sub_8_result_int;
	wire	wire_add_sub_8_cout;
	wire	[4:0]	wire_add_sub_8_dataa;
	wire	[4:0]	wire_add_sub_8_datab;
	wire	[4:0]	wire_add_sub_8_result;
	wire	[5:0]	wire_add_sub_9_result_int;
	wire	wire_add_sub_9_cout;
	wire	[4:0]	wire_add_sub_9_dataa;
	wire	[4:0]	wire_add_sub_9_datab;
	wire	[4:0]	wire_add_sub_9_result;
	wire clk_en;
	wire  [74:0]  DenominatorIn;
	wire  [74:0]  DenominatorIn_tmp;
	wire  gnd_wire;
	wire  [209:0]  nose;
	wire  [209:0]  NumeratorIn;
	wire  [209:0]  NumeratorIn_tmp;
	wire  [69:0]  prestg;
	wire  [13:0]  quotient_tmp;
	wire  [59:0]  sel;
	wire  [209:0]  selnose;
	wire  [74:0]  StageIn;
	wire  [74:0]  StageIn_tmp;
	wire  [69:0]  StageOut;
	wire  vcc_wire;

	// synopsys translate_off
	initial
		DFFDenominator = {4{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFDenominator <= {4{1'b1}};
		else if  (clk_en == 1'b1)   DFFDenominator <= {denominator};
	// synopsys translate_off
	initial
		DFFNumerator = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFNumerator <= 14'b0;
		else if  (clk_en == 1'b1)   DFFNumerator <= {numerator};
	// synopsys translate_off
	initial
		DFFQuotient[0:0] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[0:0] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[0:0] <= wire_DFFQuotient_d[0:0];
	// synopsys translate_off
	initial
		DFFQuotient[1:1] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[1:1] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[1:1] <= wire_DFFQuotient_d[1:1];
	// synopsys translate_off
	initial
		DFFQuotient[2:2] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[2:2] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[2:2] <= wire_DFFQuotient_d[2:2];
	// synopsys translate_off
	initial
		DFFQuotient[3:3] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[3:3] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[3:3] <= wire_DFFQuotient_d[3:3];
	// synopsys translate_off
	initial
		DFFQuotient[4:4] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[4:4] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[4:4] <= wire_DFFQuotient_d[4:4];
	// synopsys translate_off
	initial
		DFFQuotient[5:5] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[5:5] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[5:5] <= wire_DFFQuotient_d[5:5];
	// synopsys translate_off
	initial
		DFFQuotient[6:6] = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[6:6] <= {1{1'b1}};
		else if  (clk_en == 1'b1)   DFFQuotient[6:6] <= wire_DFFQuotient_d[6:6];
	// synopsys translate_off
	initial
		DFFQuotient[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[7:7] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[7:7] <= wire_DFFQuotient_d[7:7];
	// synopsys translate_off
	initial
		DFFQuotient[8:8] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[8:8] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[8:8] <= wire_DFFQuotient_d[8:8];
	// synopsys translate_off
	initial
		DFFQuotient[9:9] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[9:9] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[9:9] <= wire_DFFQuotient_d[9:9];
	// synopsys translate_off
	initial
		DFFQuotient[10:10] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[10:10] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[10:10] <= wire_DFFQuotient_d[10:10];
	// synopsys translate_off
	initial
		DFFQuotient[11:11] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[11:11] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[11:11] <= wire_DFFQuotient_d[11:11];
	// synopsys translate_off
	initial
		DFFQuotient[12:12] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[12:12] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[12:12] <= wire_DFFQuotient_d[12:12];
	// synopsys translate_off
	initial
		DFFQuotient[13:13] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFQuotient[13:13] <= 1'b0;
		else if  (clk_en == 1'b1)   DFFQuotient[13:13] <= wire_DFFQuotient_d[13:13];
	assign
		wire_DFFQuotient_d = {(~ selnose[0]), (~ selnose[15]), (~ selnose[30]), (~ selnose[45]), (~ selnose[60]), (~ selnose[75]), (~ selnose[90]), {7{vcc_wire}}};
	// synopsys translate_off
	initial
		DFFStage = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) DFFStage <= 5'b0;
		else if  (clk_en == 1'b1)   DFFStage <= {StageOut[34:30]};
	division_10_add_sub   add_sub_0
	( 
	.cout(wire_add_sub_0_cout),
	.dataa(NumeratorIn[13]),
	.datab(DenominatorIn[0]),
	.result(wire_add_sub_0_result));
	division_10_add_sub1   add_sub_1
	( 
	.cout(wire_add_sub_1_cout),
	.dataa({StageIn[5], NumeratorIn[26]}),
	.datab(DenominatorIn[6:5]),
	.result(wire_add_sub_1_result));
	assign
		wire_add_sub_10_result_int = wire_add_sub_10_dataa - wire_add_sub_10_datab;
	assign
		wire_add_sub_10_result = wire_add_sub_10_result_int[4:0],
		wire_add_sub_10_cout = ~wire_add_sub_10_result_int[5:5];
	assign
		wire_add_sub_10_dataa = {StageIn[53:50], NumeratorIn[143]},
		wire_add_sub_10_datab = DenominatorIn[54:50];
	assign
		wire_add_sub_11_result_int = wire_add_sub_11_dataa - wire_add_sub_11_datab;
	assign
		wire_add_sub_11_result = wire_add_sub_11_result_int[4:0],
		wire_add_sub_11_cout = ~wire_add_sub_11_result_int[5:5];
	assign
		wire_add_sub_11_dataa = {StageIn[58:55], NumeratorIn[156]},
		wire_add_sub_11_datab = DenominatorIn[59:55];
	assign
		wire_add_sub_12_result_int = wire_add_sub_12_dataa - wire_add_sub_12_datab;
	assign
		wire_add_sub_12_result = wire_add_sub_12_result_int[4:0],
		wire_add_sub_12_cout = ~wire_add_sub_12_result_int[5:5];
	assign
		wire_add_sub_12_dataa = {StageIn[63:60], NumeratorIn[169]},
		wire_add_sub_12_datab = DenominatorIn[64:60];
	assign
		wire_add_sub_13_result_int = wire_add_sub_13_dataa - wire_add_sub_13_datab;
	assign
		wire_add_sub_13_result = wire_add_sub_13_result_int[4:0],
		wire_add_sub_13_cout = ~wire_add_sub_13_result_int[5:5];
	assign
		wire_add_sub_13_dataa = {StageIn[68:65], NumeratorIn[182]},
		wire_add_sub_13_datab = DenominatorIn[69:65];
	assign
		wire_add_sub_2_result_int = wire_add_sub_2_dataa - wire_add_sub_2_datab;
	assign
		wire_add_sub_2_result = wire_add_sub_2_result_int[2:0],
		wire_add_sub_2_cout = ~wire_add_sub_2_result_int[3:3];
	assign
		wire_add_sub_2_dataa = {StageIn[11:10], NumeratorIn[39]},
		wire_add_sub_2_datab = DenominatorIn[12:10];
	assign
		wire_add_sub_3_result_int = wire_add_sub_3_dataa - wire_add_sub_3_datab;
	assign
		wire_add_sub_3_result = wire_add_sub_3_result_int[3:0],
		wire_add_sub_3_cout = ~wire_add_sub_3_result_int[4:4];
	assign
		wire_add_sub_3_dataa = {StageIn[17:15], NumeratorIn[52]},
		wire_add_sub_3_datab = DenominatorIn[18:15];
	assign
		wire_add_sub_4_result_int = wire_add_sub_4_dataa - wire_add_sub_4_datab;
	assign
		wire_add_sub_4_result = wire_add_sub_4_result_int[4:0],
		wire_add_sub_4_cout = ~wire_add_sub_4_result_int[5:5];
	assign
		wire_add_sub_4_dataa = {StageIn[23:20], NumeratorIn[65]},
		wire_add_sub_4_datab = DenominatorIn[24:20];
	assign
		wire_add_sub_5_result_int = wire_add_sub_5_dataa - wire_add_sub_5_datab;
	assign
		wire_add_sub_5_result = wire_add_sub_5_result_int[4:0],
		wire_add_sub_5_cout = ~wire_add_sub_5_result_int[5:5];
	assign
		wire_add_sub_5_dataa = {StageIn[28:25], NumeratorIn[78]},
		wire_add_sub_5_datab = DenominatorIn[29:25];
	assign
		wire_add_sub_6_result_int = wire_add_sub_6_dataa - wire_add_sub_6_datab;
	assign
		wire_add_sub_6_result = wire_add_sub_6_result_int[4:0],
		wire_add_sub_6_cout = ~wire_add_sub_6_result_int[5:5];
	assign
		wire_add_sub_6_dataa = {StageIn[33:30], NumeratorIn[91]},
		wire_add_sub_6_datab = DenominatorIn[34:30];
	assign
		wire_add_sub_7_result_int = wire_add_sub_7_dataa - wire_add_sub_7_datab;
	assign
		wire_add_sub_7_result = wire_add_sub_7_result_int[4:0],
		wire_add_sub_7_cout = ~wire_add_sub_7_result_int[5:5];
	assign
		wire_add_sub_7_dataa = {StageIn[38:35], NumeratorIn[104]},
		wire_add_sub_7_datab = DenominatorIn[39:35];
	assign
		wire_add_sub_8_result_int = wire_add_sub_8_dataa - wire_add_sub_8_datab;
	assign
		wire_add_sub_8_result = wire_add_sub_8_result_int[4:0],
		wire_add_sub_8_cout = ~wire_add_sub_8_result_int[5:5];
	assign
		wire_add_sub_8_dataa = {StageIn[43:40], NumeratorIn[117]},
		wire_add_sub_8_datab = DenominatorIn[44:40];
	assign
		wire_add_sub_9_result_int = wire_add_sub_9_dataa - wire_add_sub_9_datab;
	assign
		wire_add_sub_9_result = wire_add_sub_9_result_int[4:0],
		wire_add_sub_9_cout = ~wire_add_sub_9_result_int[5:5];
	assign
		wire_add_sub_9_dataa = {StageIn[48:45], NumeratorIn[130]},
		wire_add_sub_9_datab = DenominatorIn[49:45];
	assign
		clk_en = 1'b1,
		DenominatorIn = DenominatorIn_tmp,
		DenominatorIn_tmp = {DenominatorIn[69:35], {gnd_wire, DFFDenominator[3:0]}, DenominatorIn[29:0], {gnd_wire, denominator}},
		gnd_wire = 1'b0,
		nose = {{14{1'b0}}, wire_add_sub_13_cout, {14{1'b0}}, wire_add_sub_12_cout, {14{1'b0}}, wire_add_sub_11_cout, {14{1'b0}}, wire_add_sub_10_cout, {14{1'b0}}, wire_add_sub_9_cout, {14{1'b0}}, wire_add_sub_8_cout, {14{1'b0}}, wire_add_sub_7_cout, {14{1'b0}}, wire_add_sub_6_cout, {14{1'b0}}, wire_add_sub_5_cout, {14{1'b0}}, wire_add_sub_4_cout, {14{1'b0}}, wire_add_sub_3_cout, {14{1'b0}}, wire_add_sub_2_cout, {14{1'b0}}, wire_add_sub_1_cout, {14{1'b0}}, wire_add_sub_0_cout},
		NumeratorIn = NumeratorIn_tmp,
		NumeratorIn_tmp = {NumeratorIn[195:98], DFFNumerator[13:0], NumeratorIn[83:0], numerator},
		prestg = {wire_add_sub_13_result, wire_add_sub_12_result, wire_add_sub_11_result, wire_add_sub_10_result, wire_add_sub_9_result, wire_add_sub_8_result, wire_add_sub_7_result, wire_add_sub_6_result, wire_add_sub_5_result, wire_add_sub_4_result, {1{1'b0}}, wire_add_sub_3_result, {2{1'b0}}, wire_add_sub_2_result, {3{1'b0}}, wire_add_sub_1_result, {4{1'b0}}, wire_add_sub_0_result},
		quotient = quotient_tmp,
		quotient_tmp = {DFFQuotient[13:7], (~ selnose[105]), (~ selnose[120]), (~ selnose[135]), (~ selnose[150]), (~ selnose[165]), (~ selnose[180]), (~ selnose[195])},
		remainder = StageIn[73:70],
		sel = {gnd_wire, (sel[59] | DenominatorIn[73]), (sel[58] | DenominatorIn[72]), (sel[57] | DenominatorIn[71]), gnd_wire, (sel[55] | DenominatorIn[68]), (sel[54] | DenominatorIn[67]), (sel[53] | DenominatorIn[66]), gnd_wire, (sel[51] | DenominatorIn[63]), (sel[50] | DenominatorIn[62]), (sel[49] | DenominatorIn[61]), gnd_wire, (sel[47] | DenominatorIn[58]), (sel[46] | DenominatorIn[57]), (sel[45] | DenominatorIn[56]), gnd_wire, (sel[43] | DenominatorIn[53]), (sel[42] | DenominatorIn[52]), (sel[41] | DenominatorIn[51]), gnd_wire, (sel[39] | DenominatorIn[48]), (sel[38] | DenominatorIn[47]), (sel[37] | DenominatorIn[46]), gnd_wire, (sel[35] | DenominatorIn[43]), (sel[34] | DenominatorIn[42]), (sel[33] | DenominatorIn[41]), gnd_wire, (sel[31] | DenominatorIn[38]), (sel[30] | DenominatorIn[37]), (sel[29] | DenominatorIn[36]), gnd_wire, (sel[27] | DenominatorIn[33]), (sel[26] | DenominatorIn[32]), (sel[25] | DenominatorIn[31]), gnd_wire, (sel[23] | DenominatorIn[28]), (sel[22] | DenominatorIn[27]), (sel[21] | DenominatorIn[26]), gnd_wire, (sel[19] | DenominatorIn[23]), (sel[18] | DenominatorIn[22]), (sel[17] | DenominatorIn[21]), gnd_wire, (sel[15] | DenominatorIn[18]), (sel[14] | DenominatorIn[17]), (sel[13] | DenominatorIn[16]), gnd_wire, (sel[11] | DenominatorIn[13]), (sel[10] | DenominatorIn[12]), (sel[9] | DenominatorIn[11]), gnd_wire, (sel[7] | DenominatorIn[8]), (sel[6] | DenominatorIn[7]), (sel[5] | DenominatorIn[6]), gnd_wire, (sel[3] | DenominatorIn[3]), (sel[2] | DenominatorIn[2]), (sel[1] | DenominatorIn[1])},
		selnose = {(~ nose[209]), (~ nose[208]), (~ nose[207]), (~ nose[206]), (~ nose[205]), (~ nose[204]), (~ nose[203]), (~ nose[202]), (~ nose[201]), (~ nose[200]), ((~ nose[199]) | sel[59]), ((~ nose[198]) | sel[58]), ((~ nose[197]) | sel[57]), ((~ nose[196]) | sel[56]), (~ nose[195]), (~ nose[194]), (~ nose[193]), (~ nose[192]), (~ nose[191]), (~ nose[190]), (~ nose[189]), (~ nose[188]), (~ nose[187]), (~ nose[186]), ((~ nose[185]) | sel[55]), ((~ nose[184]) | sel[54]), ((~ nose[183]) | sel[53]), ((~ nose[182]) | sel[52]), (~ nose[181]), (~ nose[180]), (~ nose[179]), (~ nose[178]), (~ nose[177]), (~ nose[176]), (~ nose[175]), (~ nose[174]), (~ nose[173]), (~ nose[172]), ((~ nose[171]) | sel[51]), ((~ nose[170]) | sel[50]), ((~ nose[169]) | sel[49]), ((~ nose[168]) | sel[48]), (~ nose[167]), (~ nose[166]), (~ nose[165]), (~ nose[164]), (~ nose[163]), (~ nose[162]), (~ nose[161]), (~ nose[160]), (~ nose[159]), (~ nose[158]), ((~ nose[157]) | sel[47]), ((~ nose[156]) | sel[46]), ((~ nose[155]) | sel[45]), ((~ nose[154]) | sel[44]), (~ nose[153]), (~ nose[152]), (~ nose[151]), (~ nose[150]), (~ nose[149]), (~ nose[148]), (~ nose[147]), (~ nose[146]), (~ nose[145]), (~ nose[144]), ((~ nose[143]) | sel[43]), ((~ nose[142]) | sel[42]), ((~ nose[141]) | sel[41]), ((~ nose[140]) | sel[40]), (~ nose[139]), (~ nose[138]), (~ nose[137]), (~ nose[136]), (~ nose[135]), (~ nose[134]), (~ nose[133]), (~ nose[132]), (~ nose[131]), (~ nose[130]), ((~ nose[129]) | sel[39]), ((~ nose[128]) | sel[38]), ((~ nose[127]) | sel[37]), ((~ nose[126]) | sel[36]), (~ nose[125]), (~ nose[124]), (~ nose[123]), (~ nose[122]), (~ nose[121]), (~ nose[120]), (~ nose[119]), (~ nose[118]), (~ nose[117]), (~ nose[116]), ((~ nose[115]) | sel[35]), ((~ nose[114]) | sel[34]), ((~ nose[113]) | sel[33]), ((~ nose[112]) | sel[32]), (~ nose[111]), (~ nose[110]), (~ nose[109]), (~ nose[108]), (~ nose[107]), (~ nose[106]), (~ nose[105]), (~ nose[104]), (~ nose[103]), (~ nose[102]), ((~ nose[101]) | sel[31]), ((~ nose[100]) | sel[30]), ((~ nose[99]) | sel[29]),
 ((~ nose[98]) | sel[28]), (~ nose[97]), (~ nose[96]), (~ nose[95]), (~ nose[94]), (~ nose[93]), (~ nose[92]), (~ nose[91]), (~ nose[90]), (~ nose[89]), (~ nose[88]), ((~ nose[87]) | sel[27]), ((~ nose[86]) | sel[26]), ((~ nose[85]) | sel[25]), ((~ nose[84]) | sel[24]), (~ nose[83]), (~ nose[82]), (~ nose[81]), (~ nose[80]), (~ nose[79]), (~ nose[78]), (~ nose[77]), (~ nose[76]), (~ nose[75]), (~ nose[74]), ((~ nose[73]) | sel[23]), ((~ nose[72]) | sel[22]), ((~ nose[71]) | sel[21]), ((~ nose[70]) | sel[20]), (~ nose[69]), (~ nose[68]), (~ nose[67]), (~ nose[66]), (~ nose[65]), (~ nose[64]), (~ nose[63]), (~ nose[62]), (~ nose[61]), (~ nose[60]), ((~ nose[59]) | sel[19]), ((~ nose[58]) | sel[18]), ((~ nose[57]) | sel[17]), ((~ nose[56]) | sel[16]), (~ nose[55]), (~ nose[54]), (~ nose[53]), (~ nose[52]), (~ nose[51]), (~ nose[50]), (~ nose[49]), (~ nose[48]), (~ nose[47]), (~ nose[46]), ((~ nose[45]) | sel[15]), ((~ nose[44]) | sel[14]), ((~ nose[43]) | sel[13]), ((~ nose[42]) | sel[12]), (~ nose[41]), (~ nose[40]), (~ nose[39]), (~ nose[38]), (~ nose[37]), (~ nose[36]), (~ nose[35]), (~ nose[34]), (~ nose[33]), (~ nose[32]), ((~ nose[31]) | sel[11]), ((~ nose[30]) | sel[10]), ((~ nose[29]) | sel[9]), ((~ nose[28]) | sel[8]), (~ nose[27]), (~ nose[26]), (~ nose[25]), (~ nose[24]), (~ nose[23]), (~ nose[22]), (~ nose[21]), (~ nose[20]), (~ nose[19]), (~ nose[18]), ((~ nose[17]) | sel[7]), ((~ nose[16]) | sel[6]), ((~ nose[15]) | sel[5]), ((~ nose[14]) | sel[4]), (~ nose[13]), (~ nose[12]), (~ nose[11]), (~ nose[10]), (~ nose[9]), (~ nose[8]), (~ nose[7]), (~ nose[6]), (~ nose[5]), (~ nose[4]), ((~ nose[3]) | sel[3]), ((~ nose[2]) | sel[2]), ((~ nose[1]) | sel[1]), ((~ nose[0]) | sel[0])},
		StageIn = StageIn_tmp,
		StageIn_tmp = {StageOut[69:35], DFFStage[4:0], StageOut[29:0], {5{1'b0}}},
		StageOut = {(({StageIn[68:65], NumeratorIn[182]} & {5{selnose[195]}}) | (prestg[69:65] & {5{(~ selnose[195])}})), (({StageIn[63:60], NumeratorIn[169]} & {5{selnose[180]}}) | (prestg[64:60] & {5{(~ selnose[180])}})), (({StageIn[58:55], NumeratorIn[156]} & {5{selnose[165]}}) | (prestg[59:55] & {5{(~ selnose[165])}})), (({StageIn[53:50], NumeratorIn[143]} & {5{selnose[150]}}) | (prestg[54:50] & {5{(~ selnose[150])}})), (({StageIn[48:45], NumeratorIn[130]} & {5{selnose[135]}}) | (prestg[49:45] & {5{(~ selnose[135])}})), (({StageIn[43:40], NumeratorIn[117]} & {5{selnose[120]}}) | (prestg[44:40] & {5{(~ selnose[120])}})), (({StageIn[38:35], NumeratorIn[104]} & {5{selnose[105]}}) | (prestg[39:35] & {5{(~ selnose[105])}})), (({StageIn[33:30], NumeratorIn[91]} & {5{selnose[90]}}) | (prestg[34:30] & {5{(~ selnose[90])}})), (({StageIn[28:25], NumeratorIn[78]} & {5{selnose[75]}}) | (prestg[29:25] & {5{(~ selnose[75])}})), (({StageIn[23:20], NumeratorIn[65]} & {5{selnose[60]}}) | (prestg[24:20] & {5{(~ selnose[60])}})), (({StageIn[18:15], NumeratorIn[52]} & {5{selnose[45]}}) | (prestg[19:15] & {5{(~ selnose[45])}})), (({StageIn[13:10], NumeratorIn[39]} & {5{selnose[30]}}) | (prestg[14:10] & {5{(~ selnose[30])}})), (({StageIn[8:5], NumeratorIn[26]} & {5{selnose[15]}}) | (prestg[9:5] & {5{(~ selnose[15])}})), (({StageIn[3:0], NumeratorIn[13]} & {5{selnose[0]}}) | (prestg[4:0] & {5{(~ selnose[0])}}))},
		vcc_wire = 1'b1;
endmodule //division_10_alt_u_div

//synthesis_resources = lut 69 reg 37 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  division_10_sign_div_unsign
	( 
	aclr,
	clock,
	denominator,
	numerator,
	quotient,
	remainder) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   [3:0]  denominator;
	input   [13:0]  numerator;
	output   [13:0]  quotient;
	output   [3:0]  remainder;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [13:0]   wire_divider_quotient;
	wire  [3:0]   wire_divider_remainder;
	wire  [13:0]  norm_num;
	wire  [13:0]  protect_quotient;
	wire  [3:0]  protect_remainder;

	division_10_alt_u_div   divider
	( 
	.aclr(aclr),
	.clock(clock),
	.denominator(denominator),
	.numerator(norm_num),
	.quotient(wire_divider_quotient),
	.remainder(wire_divider_remainder));
	assign
		norm_num = numerator,
		protect_quotient = wire_divider_quotient,
		protect_remainder = wire_divider_remainder,
		quotient = protect_quotient,
		remainder = protect_remainder;
endmodule //division_10_sign_div_unsign

//synthesis_resources = lut 69 reg 37 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  division_10_lpm_divide
	( 
	aclr,
	clock,
	denom,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   [3:0]  denom;
	input   [13:0]  numer;
	output   [13:0]  quotient;
	output   [3:0]  remain;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [13:0]   wire_divider_quotient;
	wire  [3:0]   wire_divider_remainder;
	wire  [13:0]  numer_tmp;

	division_10_sign_div_unsign   divider
	( 
	.aclr(aclr),
	.clock(clock),
	.denominator(denom),
	.numerator(numer_tmp),
	.quotient(wire_divider_quotient),
	.remainder(wire_divider_remainder));
	assign
		numer_tmp = numer,
		quotient = wire_divider_quotient,
		remain = wire_divider_remainder;
endmodule //division_10_lpm_divide
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module division_10 (
	aclr,
	clock,
	denom,
	numer,
	quotient,
	remain)/* synthesis synthesis_clearbox = 1 */;

	input	  aclr;
	input	  clock;
	input	[3:0]  denom;
	input	[13:0]  numer;
	output	[13:0]  quotient;
	output	[3:0]  remain;

	wire [13:0] sub_wire0;
	wire [3:0] sub_wire1;
	wire [13:0] quotient = sub_wire0[13:0];
	wire [3:0] remain = sub_wire1[3:0];

	division_10_lpm_divide	division_10_lpm_divide_component (
				.aclr (aclr),
				.clock (clock),
				.denom (denom),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
// Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "-1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_HINT STRING "LPM_REMAINDERPOSITIVE=TRUE"
// Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
// Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "4"
// Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "14"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT NODEFVAL "aclr"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: denom 0 0 4 0 INPUT NODEFVAL "denom[3..0]"
// Retrieval info: USED_PORT: numer 0 0 14 0 INPUT NODEFVAL "numer[13..0]"
// Retrieval info: USED_PORT: quotient 0 0 14 0 OUTPUT NODEFVAL "quotient[13..0]"
// Retrieval info: USED_PORT: remain 0 0 4 0 OUTPUT NODEFVAL "remain[3..0]"
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @denom 0 0 4 0 denom 0 0 4 0
// Retrieval info: CONNECT: @numer 0 0 14 0 numer 0 0 14 0
// Retrieval info: CONNECT: quotient 0 0 14 0 @quotient 0 0 14 0
// Retrieval info: CONNECT: remain 0 0 4 0 @remain 0 0 4 0
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL division_10_syn.v TRUE
// Retrieval info: LIB_FILE: lpm