module bpm_trigger_value(
	input 				i_clk,
	input 				i_reset,
	
	input 		[33:0]	i_bpm_counter,
	
	output		[33:0]	o_bpm_trigger_value
);
	
	wire [39:0] quotient;	
	wire [39:0] remain;		
	bpm_divider bpm_divider_inst(
		.aclr(divider_reset),				//	input	  aclr;				
		.clock(i_clk),						//	input	  clock;			
		.denom({{6{1'b0}}, i_bpm_counter}),	//	input	[39:0]  denom;		
		.numer(40'd12000000000),			//	input	[39:0]  numer;		
		.quotient(quotient),				//	output	[39:0]  quotient;	
		.remain(remain)						//	output	[39:0]  remain;		
	);
	
	assign o_bpm_trigger_value = (quotient[33:0] == {34{1'b1}}) ? 0 : quotient[33:0];
	
endmodule