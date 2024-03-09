module ssi_digits(
	input 			i_clk, 
	input 			i_reset, 
	
	input	[13:0] 	i_number,
	
	output 	[3:0] 	o_digit,
	output 	[3:0] 	o_digit_ten,
	output 	[3:0] 	o_digit_hundred,
	output 	[3:0] 	o_digit_thousand
);
	wire [13:0] quotient_hundred;
	
	wire [13:0] quotient_digit;
	wire [3:0] 	remain_digit;
	assign o_digit = (quotient_hundred > 14'd9) ? 4'd9: remain_digit;
	division_10 division_10_1(
		.aclr(i_reset),					//	input	  		aclr,				
		.clock(i_clk),					//	input	  		clock,			
		.denom(4'd10),					//	input	[3:0]  	denom,		
		.numer(i_number),				//	input	[13:0]  numer,		
		.quotient(quotient_digit),		//	output	[13:0]  quotient,	
		.remain(remain_digit)			//	output	[3:0]  	remain		
	);

	wire [13:0] quotient_ten;
	wire [3:0] 	remain_ten;
	assign o_digit_ten = (quotient_hundred > 14'd9) ? 4'd9: remain_ten;
	division_10 division_10_2(
		.aclr(i_reset),					//	input	  		aclr,				
		.clock(i_clk),					//	input	  		clock,			
		.denom(4'd10),					//	input	[3:0]  	denom,		
		.numer(quotient_digit),			//	input	[13:0]  numer,		
		.quotient(quotient_ten),		//	output	[13:0]  quotient,	
		.remain(remain_ten)				//	output	[3:0]  	remain		
	);
	
	wire [3:0] 	remain_hundred;
	assign o_digit_hundred 	= (quotient_hundred > 14'd9) ? 4'd9: remain_hundred;
	assign o_digit_thousand = (quotient_hundred > 14'd9) ? 4'd9: quotient_hundred;
	division_10 division_10_3(
		.aclr(i_reset),					//	input	  		aclr,				
		.clock(i_clk),					//	input	  		clock,			
		.denom(4'd10),					//	input	[3:0]  	denom,		
		.numer(quotient_ten),			//	input	[13:0]  numer,		
		.quotient(quotient_hundred),	//	output	[13:0]  quotient,	
		.remain(remain_hundred)			//	output	[3:0]  	remain		
	);
	
endmodule