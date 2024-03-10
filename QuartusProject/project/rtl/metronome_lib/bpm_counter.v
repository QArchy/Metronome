module bpm_counter(
	input i_clk,
	input i_reset,
	
	input i_btn_plus_1,
	input i_btn_plus_5,
	input i_btn_minus_1,
	input i_btn_minus_5,
	
	input i_uart_msg,
	input [31:0] i_uart_bpm_count,
	
	output reg 	[33:0] 	o_bpm_counter,
	output 		 		o_bpm_changed
);
	wire [33:0] bpm_counter_adder;
	wire 		bpm_changed;
	bpm_counter_adder bpm_counter_adder_inst(
		.i_clk(i_clk),								//	input i_clk,
		.i_reset(i_reset),							//	input i_reset,
													//	
		.i_btn_plus_1(i_btn_plus_1),				//	input i_btn_plus_1,
		.i_btn_plus_5(i_btn_plus_5),				//	input i_btn_plus_5,
		.i_btn_minus_1(i_btn_minus_1),				//	input i_btn_minus_1,
		.i_btn_minus_5(i_btn_minus_5),				//	input i_btn_minus_5,
													//	
		.o_bpm_counter_adder(bpm_counter_adder),	//	output reg 	[33:0] 	o_bpm_counter_adder
		.o_bpm_changed(bpm_changed)					//	output reg 			o_bpm_changed
	);
	
	assign o_bpm_changed = i_uart_msg || bpm_changed;
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_bpm_counter <= 0;
		end else begin
			o_bpm_counter <= i_uart_msg ? {2'b00, i_uart_bpm_count} : (o_bpm_counter + bpm_counter_adder);
		end
	end
	
endmodule