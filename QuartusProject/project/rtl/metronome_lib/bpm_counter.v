module bpm_counter(
	input i_clk,
	input i_reset,
	
	input i_btn_plus_1,		
	input i_btn_plus_5,		
	input i_btn_plus_5_hold,
	input i_btn_minus_1,	
	input i_btn_minus_5,
	input i_btn_minus_5_hold,
	
	input i_uart_msg,
	input [31:0] i_uart_bpm_count,
	
	output reg 	[33:0] 	o_bpm_counter,
	output reg		 	o_bpm_changed
);
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_bpm_counter <= 0;
		end else begin
			if (i_uart_msg) begin
				o_bpm_counter <= {2'b00, i_uart_bpm_count};
				o_bpm_changed <= 1;
			end else begin
				if (i_btn_plus_1) begin
					o_bpm_counter <= o_bpm_counter + 1;
					o_bpm_changed <= 1;
				end else if (i_btn_plus_5) begin
					o_bpm_counter <= o_bpm_counter + 5;
					o_bpm_changed <= 1;
				end else if (i_btn_plus_5_hold) begin
					o_bpm_counter <= o_bpm_counter + 10;
					o_bpm_changed <= 1;
				end else if (i_btn_minus_1) begin
					o_bpm_counter <= (o_bpm_counter > 0) ? (o_bpm_counter - 1): 0; 
					o_bpm_changed <= 1;
				end else if (i_btn_minus_5) begin
					o_bpm_counter <= (o_bpm_counter > 4) ? (o_bpm_counter - 5): 0; 
					o_bpm_changed <= 1;
				end else if (i_btn_minus_5_hold) begin
					o_bpm_counter <= (o_bpm_counter > 9) ? (o_bpm_counter - 10): 0; 
					o_bpm_changed <= 1;
				end else begin 
					o_bpm_changed <= 0;
				end
			end
		end
	end
	
endmodule