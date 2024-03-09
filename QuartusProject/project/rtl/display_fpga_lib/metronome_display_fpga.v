module metronome_display_fpga(
	input 			i_clk,
	input 			i_reset,
	
	input 			i_trigger,
	input 	[33:0] 	i_bpm_counter,
	
	output 	[2:0] 	o_bpm_led,
	output 	[6:0] 	o_ssi_segments,	
	output 	[3:0] 	o_ssi_code		
);
	
	led_light_holder led_light_holder_inst(
		.i_clk(i_clk),				//	input 		i_clk,		
		.i_reset(i_reset),			//	input 		i_reset,	
		.i_trigger(i_trigger),		//	input 		i_trigger,	
		.o_bpm_led(o_bpm_led[2])	//	output reg 	o_bpm_led			
	);
	
	assign o_bpm_led[0] = (i_bpm_counter >= 600) ? 1: 0;
	
	ssi_bpm_display ssi_bpm_display_inst(
		.i_clk(i_clk),						//	input 			i_clk,				
		.i_reset(i_reset),					//	input 			i_reset,			
											//										
		.i_bpm_count(i_bpm_counter),		//	input  [13:0] 	i_bpm_count,		
											//										
		.o_ssi_segments(o_ssi_segments),	//	output [6:0] 	o_ssi_segments,		
		.o_ssi_code(o_ssi_code)				//	output [3:0] 	o_ssi_code,			
	);
	
	assign o_bpm_led[1] = (i_bpm_counter >= 14'd9999) ? 1: 0;
	
endmodule