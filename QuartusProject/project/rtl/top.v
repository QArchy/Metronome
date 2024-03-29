module top(
	input 			i_clk,
	
	input 			i_uart_rx,
	
	output	[3:0]	o_led_n,
	
	output 	[6:0] 	o_ssi_segments,	
	output 	[3:0] 	o_ssi_code		
);
	wire [3:0] led;
	assign o_led_n = ~led;
	
	wire pll_clk;
	wire pll_clk_uart;
	wire pll_locked;
	pll pll_inst(
		.inclk0(i_clk),		//	input	  inclk0;
		.c0(pll_clk),		//	output	  c0;
		.c1(pll_clk_uart),	//	output	  c1;
		.locked(pll_locked)	//	output	  locked;
	);
	
	wire [4:0] probe_control_btns;
	control_btns_probes control_btns_probes_inst(
		.source(probe_control_btns),	//	output	[4:0]	source;
		.probe({1'b0, led}),			//	input	[4:0]	probe;
		.source_clk(pll_clk)			//	input		source_clk;
	);	
	
	wire btn_reset;
	wire btn_metronome_plus_1;
	wire btn_metronome_plus_5;
	wire btn_metronome_plus_5_hold;
	wire btn_metronome_minus_1;
	wire btn_metronome_minus_5;
	wire btn_metronome_minus_5_hold;
	btn_debouncer btn_debouncer_inst(
		.i_clk(pll_clk),											//	input			i_clk,
																	//
		.i_btn_reset(probe_control_btns[4]),						//	input 			i_btn_reset,
																	//	
		.i_control_btns(probe_control_btns[3:0]),					//	input 	[3:0] 	control_btns,
																	//	
		.o_btn_reset(btn_reset),									//	output 		 	o_btn_reset,
																	//	
		.o_btn_metronome_plus_1(btn_metronome_plus_1),				//	output 		 	o_btn_metronome_plus_1,
		.o_btn_metronome_plus_5(btn_metronome_plus_5),				//	output 		 	o_btn_metronome_plus_5,
		.o_btn_metronome_plus_5_hold(btn_metronome_plus_5_hold),	//	output 		 	o_btn_metronome_plus_5_hold,
		.o_btn_metronome_minus_1(btn_metronome_minus_1),			//	output 		 	o_btn_metronome_minus_1,
		.o_btn_metronome_minus_5(btn_metronome_minus_5),			//	output 		 	o_btn_metronome_minus_5,
		.o_btn_metronome_minus_5_hold(btn_metronome_minus_5_hold)	//	output 		 	o_btn_metronome_minus_5_hold
	);
	
	wire global_reset = btn_reset || ~pll_locked;
	
	wire uart_msg;
	wire [31:0] uart_bpm_count;
	uart_receive_bpm uart_receive_bpm_inst(
		.i_clk(pll_clk_uart),			//	input 				i_clk,
		.i_reset(global_reset),			//	input 				i_reset,			
		.i_uart_rx(i_uart_rx),			//	input 				i_uart_rx,			
		.o_from_uart_ready(uart_msg),	//	output reg 			o_from_uart_ready,
		.o_bpm_count(uart_bpm_count)	//	output reg 	[31:0] 	o_bpm_count
	);
	
	wire 		trigger;
	wire [33:0] bpm_counter;
	metronome metronome_inst(
		.i_clk(pll_clk),									//	input i_clk,			
		.i_reset(global_reset),								//	input i_reset,			
															//	
		.i_btn_plus_1(btn_metronome_plus_1),				//	input i_btn_plus_1,		
		.i_btn_plus_5(btn_metronome_plus_5),				//	input i_btn_plus_5,		
		.i_btn_plus_5_hold(btn_metronome_plus_5_hold),		//	input i_btn_plus_5_hold,		
		.i_btn_minus_1(btn_metronome_minus_1),				//	input i_btn_minus_1,	
		.i_btn_minus_5(btn_metronome_minus_5),				//	input i_btn_minus_5,
		.i_btn_minus_5_hold(btn_metronome_minus_5_hold),	//	input i_btn_minus_5_hold,
															//
		.i_uart_msg(uart_msg),								//	input i_uart_msg,
		.i_uart_bpm_count(uart_bpm_count),					//	input [31:0] i_uart_bpm_count,
															//	
		.o_trigger(trigger),								//	output reg 			o_trigger,	
		.o_bpm_counter(bpm_counter)							//  output 		[33:0] 	o_bpm_counter
	); 
	
	metronome_display_fpga metronome_display_fpga_inst(
		.i_clk(pll_clk),					//	input 			i_clk,			
		.i_reset(global_reset),				//	input 			i_reset,		
											//									
		.i_trigger(trigger),				//	input 			i_trigger,		
		.i_bpm_counter(bpm_counter),		//	input 	[33:0] 	i_bpm_counter,
											//										
		.o_bpm_led(led[3:1]),				//	output 	[2:0] 	o_bpm_led		
		.o_ssi_segments(o_ssi_segments),	//	output 	[6:0] 	o_ssi_segments,	
		.o_ssi_code(o_ssi_code)				//	output 	[3:0] 	o_ssi_code		
	);
	
	life_led life_led_inst(
		.i_clk(pll_clk),		//	input 		i_clk,	
		.i_reset(global_reset),	//	input 		i_reset,
		.o_life_led(led[0])		//	output reg 	life_led
	);
	
endmodule