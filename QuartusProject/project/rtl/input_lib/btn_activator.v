module btn_activator(
	input 		i_clk,
	input 		i_btn_posedge,
	output reg 	o_btn
);
	
	reg 		btn_start_wait;
	reg	[24:0] 	btn_wait_counter;
	
	always @(posedge i_clk) begin // btn_reset waiter block
		// issue btn signal to logic and wait ~0.1 seconds till next press
		o_btn					<= (i_btn_posedge && ~btn_start_wait) ? 1: 0;
		btn_start_wait			<= (i_btn_posedge && ~btn_start_wait) ? 1: btn_start_wait;
		if (btn_wait_counter == {25{1'b1}}) begin
			btn_wait_counter 	<= 0;
			btn_start_wait 		<= 0;
		end else begin
			btn_wait_counter	<= btn_wait_counter + 1;
		end
	end
	
endmodule
