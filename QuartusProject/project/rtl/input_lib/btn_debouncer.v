module btn_debouncer(
	input 			i_clk,
	
	input 			i_btn_reset,
  
    input	[3:0] 	i_control_btns,
	
    output 		 	o_btn_reset,
	
    output 		 	o_btn_metronome_plus_1,
    output 		 	o_btn_metronome_plus_5,
    output 		 	o_btn_metronome_minus_1,
    output 		 	o_btn_metronome_minus_5
);
	
	wire			btn_reset_posedge;
	wire	[3:0]	control_btns_posedge;
	btn_posedge btn_posedge_inst(
		.i_clk(i_clk),									//	input 				i_clk,
		.i_btn_reset(i_btn_reset),						//	input 				i_btn_reset,
		.i_control_btns(i_control_btns),				//	input		[3:0] 	i_control_btns,
		.o_btn_reset_posedge(btn_reset_posedge),		//	output	reg			o_btn_reset_posedge,
		.o_control_btns_posedge(control_btns_posedge)	//	output	reg	[3:0]	o_control_btns_posedge
	);
	
	btn_activator btn_activator_reset(
		.i_clk(i_clk),									//	input 	i_clk,			
		.i_btn_posedge(btn_reset_posedge),				//	input 	i_btn_posedge,	
		.o_btn(o_btn_reset)								//	output 	o_btn			
	);	
		
	btn_activator btn_activator_plus_1(	
		.i_clk(i_clk),									//	input 	i_clk,			
		.i_btn_posedge(control_btns_posedge[0]),		//	input 	i_btn_posedge,	
		.o_btn(o_btn_metronome_plus_1)					//	output 	o_btn			
	);	
		
	btn_activator btn_activator_plus_5(	
		.i_clk(i_clk),									//	input 	i_clk,			
		.i_btn_posedge(control_btns_posedge[1]),		//	input 	i_btn_posedge,	
		.o_btn(o_btn_metronome_plus_5)					//	output 	o_btn			
	);	
		
	btn_activator btn_activator_minus_1(	
		.i_clk(i_clk),									//	input 	i_clk,			
		.i_btn_posedge(control_btns_posedge[2]),		//	input 	i_btn_posedge,	
		.o_btn(o_btn_metronome_minus_1)					//	output 	o_btn			
	);	
		
	btn_activator btn_activator_minus_5(	
		.i_clk(i_clk),									//	input 	i_clk,			
		.i_btn_posedge(control_btns_posedge[3]),		//	input 	i_btn_posedge,	
		.o_btn(o_btn_metronome_minus_5)					//	output 	o_btn			
	);
	
endmodule