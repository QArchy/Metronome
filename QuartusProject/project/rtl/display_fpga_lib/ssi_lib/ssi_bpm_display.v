module ssi_bpm_display(
	input i_clk,
	input i_reset,
	
	input [13:0] i_bpm_count,
	
	output [6:0] o_ssi_segments,
	output [3:0] o_ssi_code
);

	wire [3:0] digit;
	wire [3:0] digit_ten;
	wire [3:0] digit_hundred;
	wire [3:0] digit_thousand;
	ssi_digits ssi_digits_inst(
		.i_clk(i_clk), 						//	input 			i_clk, 
		.i_reset(i_reset), 					//	input 			i_reset, 
											//	
		.i_number(i_bpm_count),				//	input  [13:0] 	i_number,
											//	
		.o_digit(digit),					//	output [3:0] 	o_digit,
		.o_digit_ten(digit_ten),			//	output [3:0] 	o_digit_ten,
		.o_digit_hundred(digit_hundred),	//	output [3:0] 	o_digit_hundred,
		.o_digit_thousand(digit_thousand)	//	output [3:0] 	o_digit_thousand
	);
	
	ssi_switch ssi_switch_inst(
		.i_clk(i_clk), 						//	input i_clk, 
		.i_reset(i_reset), 					//	input i_reset, 
											//	
		.i_digit(digit),					//	input [3:0] i_digit,
		.i_digit_ten(digit_ten),			//	input [3:0] i_digit_ten,
		.i_digit_hundred(digit_hundred),	//	input [3:0] i_digit_hundred,
		.i_digit_thousand(digit_thousand),	//	input [3:0] i_digit_thousand,
											//	
		.o_ssi_code(o_ssi_code),			//	output reg 	[3:0] o_ssi_code,
		.o_segments(o_ssi_segments)			//	output 		[6:0] o_segments
	);
	
endmodule

