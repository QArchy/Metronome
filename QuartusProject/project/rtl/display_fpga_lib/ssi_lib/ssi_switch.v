module ssi_switch(
	input i_clk, 
	input i_reset, 
	
	input [3:0] i_digit,
	input [3:0] i_digit_ten,
	input [3:0] i_digit_hundred,
	input [3:0] i_digit_thousand,
	
	output reg 	[3:0] o_ssi_code,
	output 		[6:0] o_segments
);
	
	reg [3:0] 	ssi_digit;
	reg	[1:0] 	ssi_choose_counter;
	reg [19:0] 	ssi_switch_timer;
	
	ssi_encoder ssi_encoder_inst(
		.i_clk(i_clk), 			//	input 				i_clk, 
		.i_reset(i_reset), 		//	input 				i_reset, 
		.i_digit(ssi_digit), 	//	input 		[3:0] 	i_digit, 
		.o_segments(o_segments)	//	output reg 	[6:0] 	o_segments
	);
	
	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_ssi_code 			<= 0;
			ssi_choose_counter 	<= 0;
			ssi_switch_timer 	<= 0;
		end else begin
			
			if (ssi_switch_timer == {20{1'b1}}) begin
				ssi_switch_timer 	<= 0;
				ssi_choose_counter 	<= ssi_choose_counter + 1;
			end else begin
				ssi_switch_timer 	<= ssi_switch_timer + 1;
			end
			
			case(ssi_choose_counter)
				2'b00: begin o_ssi_code <= 4'b1110; ssi_digit <= i_digit; 			end
				2'b01: begin o_ssi_code <= 4'b1101; ssi_digit <= i_digit_ten;		end
				2'b10: begin o_ssi_code <= 4'b1011; ssi_digit <= i_digit_hundred;	end
				2'b11: begin o_ssi_code <= 4'b0111; ssi_digit <= i_digit_thousand;	end
			endcase
			
		end
	end
	
endmodule