module metronome(
	input i_clk,
	input i_reset,
	
	input i_btn_plus_1,
	input i_btn_plus_5,
	input i_btn_minus_1,
	input i_btn_minus_5,
	
	output [2:0] o_bpm_led
);
	
	wire 		trigger;
	wire [33:0] bpm_counter;
	bpm_trigger bpm_trigger_inst(
		.i_clk(i_clk),					//	input i_clk,			
		.i_reset(i_reset),				//	input i_reset,			
										//	
		.i_btn_plus_1(i_btn_plus_1),	//	input i_btn_plus_1,		
		.i_btn_plus_5(i_btn_plus_5),	//	input i_btn_plus_5,		
		.i_btn_minus_1(i_btn_minus_1),	//	input i_btn_minus_1,	
		.i_btn_minus_5(i_btn_minus_5),	//	input i_btn_minus_5,
										//	
		.o_trigger(trigger),			//	output reg 			o_trigger	
		.o_bpm_counter(bpm_counter)		//  output 		[33:0] 	o_bpm_counter;
	);
	
	led_light_holder led_light_holder_inst(
		.i_clk(i_clk),				//	input 				i_clk,		
		.i_reset(i_reset),			//	input 				i_reset,	
		.i_trigger(trigger),		//	input 				i_trigger,	
		.o_bpm_led(o_bpm_led[2:1])	//	output reg 	[1:0] 	o_bpm_led			
	);
	
	assign o_bpm_led[0] = (bpm_counter >= 600) ? 1: 0;
	
endmodule