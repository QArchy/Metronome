module bpm_counter_adder(
	input i_clk,
	input i_reset,
	
	input i_btn_plus_1,
	input i_btn_plus_5,
	input i_btn_minus_1,
	input i_btn_minus_5,
	
	output reg 	[33:0] 	o_bpm_counter_adder,
	output reg 			o_bpm_changed
);
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_bpm_counter_adder <= 0;
		end else begin
			if (i_btn_plus_1) begin
				o_bpm_counter_adder <= -5;
				o_bpm_changed		<= 1;
			end else if (i_btn_plus_5) begin
				o_bpm_counter_adder <= 5;
				o_bpm_changed		<= 1;
			end else if (i_btn_minus_1) begin
				o_bpm_counter_adder <= 95;
				o_bpm_changed		<= 1;
			end else if (i_btn_minus_5) begin
				o_bpm_counter_adder <= 995;
				o_bpm_changed		<= 1;
			end else begin 
				o_bpm_counter_adder <= 0;
				o_bpm_changed		<= 0;
			end
		end
	end
	
endmodule