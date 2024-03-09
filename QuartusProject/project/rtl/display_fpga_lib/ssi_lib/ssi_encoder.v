module ssi_encoder(
	input 				i_clk, 
	input 				i_reset, 
	input 		[3:0] 	i_digit, 
	output reg 	[6:0] 	o_segments
);

	always @(posedge i_clk, posedge i_reset) begin
		if (i_reset) begin
			o_segments <= 7'b1000000;
		end else begin
			case(i_digit)
				0: o_segments <= 7'b1000000;
				1: o_segments <= 7'b1111001;
				2: o_segments <= 7'b0100100;
				3: o_segments <= 7'b0110000;
				4: o_segments <= 7'b0011001;
				5: o_segments <= 7'b0010010;
				6: o_segments <= 7'b0000010;
				7: o_segments <= 7'b1111000;
				8: o_segments <= 7'b0000000;
				9: o_segments <= 7'b0010000;
				default: o_segments <= 7'b1000000;
			endcase
		end
	end
	
endmodule