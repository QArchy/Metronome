module btn_hold_activator(
	input 		i_clk,
	input 		i_btn,
	input 		i_btn_pressed,
	output reg 	o_btn_hold
);
	
	reg btn_pressed;
	reg [27:0] one_second_counter;
	
	always @(posedge i_clk) begin // btn_reset waiter block
		btn_pressed 		<= i_btn_pressed ? 1: btn_pressed;
		
		if (i_btn && btn_pressed) begin
			if (one_second_counter == {28{1'b1}}) begin
				one_second_counter 	<= 0;
				o_btn_hold			<= 1;
			end else begin
				one_second_counter 	<= one_second_counter + 1;
				o_btn_hold 			<= 0;
			end
		end else if (~i_btn) begin
			btn_pressed 		<= 0;
			one_second_counter 	<= 0;
			o_btn_hold			<= 0;
		end else;
	end
	
endmodule