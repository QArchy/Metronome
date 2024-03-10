module metronome(
	input i_clk,
	input i_reset,
	
	input i_btn_plus_1,
	input i_btn_plus_5,
	input i_btn_minus_1,
	input i_btn_minus_5,
	
	input i_uart_msg,
	input [31:0] i_uart_bpm_count,
	
	output reg 			o_trigger,
	output 		[33:0] 	o_bpm_counter
);
	
	wire bpm_changed;
	bpm_counter bpm_counter_inst(
		.i_clk(i_clk),							//	input i_clk,
		.i_reset(i_reset),						//	input i_reset,
												//	
		.i_btn_plus_1(i_btn_plus_1),			//	input i_btn_plus_1,
		.i_btn_plus_5(i_btn_plus_5),			//	input i_btn_plus_5,
		.i_btn_minus_1(i_btn_minus_1),			//	input i_btn_minus_1,
		.i_btn_minus_5(i_btn_minus_5),			//	input i_btn_minus_5,
												//
		.i_uart_msg(i_uart_msg),				//	input i_uart_msg,
		.i_uart_bpm_count(i_uart_bpm_count),	//	input [31:0] i_uart_bpm_count,
												//	
		.o_bpm_counter(o_bpm_counter),			//	output reg 	[33:0] 	o_bpm_counter
		.o_bpm_changed(bpm_changed)				//	output reg 		 	o_bpm_changed
	);
	
	wire [33:0] bpm_trigger_value;
	bpm_trigger_value bpm_trigger_value_inst(
		.i_clk(i_clk),							//	input 				i_clk,
		.i_reset(i_reset),						//	input 				i_reset,
												//	
		.i_bpm_counter(o_bpm_counter),			//	input 		[33:0]	i_bpm_counter,
												//	
		.o_bpm_trigger_value(bpm_trigger_value)	//	output	reg	[33:0]	o_bpm_trigger_value
	);
	
	reg [33:0] counter;
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			counter <= 0;
		end else begin
			if (counter == bpm_trigger_value) begin
				o_trigger 	<= 1;
				counter 	<= 1;
			end else begin
				counter 	<= bpm_changed ? 0: counter + 1;
				o_trigger 	<= 0;
			end
		end
	end
	
endmodule