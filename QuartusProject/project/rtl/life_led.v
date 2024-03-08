module life_led(
	input 		i_clk,
	input 		i_reset,
	output reg 	o_life_led
);
	
	reg [24:0] counter;
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_life_led <= 0;
		end else begin
			counter 	<= counter + 1;
			o_life_led 	<= (counter == {25{1'b1}}) ? ~o_life_led: o_life_led;
		end
	end
	
endmodule