module led_light_holder(
	input 				i_clk,
	input 				i_reset,
	input 				i_trigger,
	output reg 	[1:0] 	o_bpm_led
);
	reg 		led_light_hold_start;
	reg [23:0] 	led_light_hold_start_counter;
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_bpm_led <= 2'b00;
		end else begin
			led_light_hold_start <= i_trigger ? 1: led_light_hold_start;
			if (led_light_hold_start) begin
				if (led_light_hold_start_counter == {24{1'b1}}) begin
					led_light_hold_start			<= 0;
					led_light_hold_start_counter 	<= 0;
					o_bpm_led 						<= 2'b00;
				end else begin
					led_light_hold_start_counter 	<= led_light_hold_start_counter + 1;
					o_bpm_led 						<= 2'b11;
				end
			end else begin
				o_bpm_led <= 2'b00;
			end
		end
	end
	
endmodule