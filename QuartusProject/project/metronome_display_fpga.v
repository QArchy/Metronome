module metronome_display_fpga(
	input 			i_clk,
	input 			i_reset,
	
	input 			i_trigger,
	input 	[33:0] 	i_bpm_counter,
	
	output 	[2:0] 	o_bpm_led
);
	
	led_light_holder led_light_holder_inst(
		.i_clk(i_clk),				//	input 				i_clk,		
		.i_reset(i_reset),			//	input 				i_reset,	
		.i_trigger(i_trigger),		//	input 				i_trigger,	
		.o_bpm_led(o_bpm_led[2:1])	//	output reg 	[1:0] 	o_bpm_led			
	);
	
	assign o_bpm_led[0] = (i_bpm_counter >= 600) ? 1: 0;
	
endmodule