module btn_posedge(
	input 				i_clk,
	input 				i_btn_reset,
	input		[3:0] 	i_control_btns,
	output	reg			o_btn_reset_posedge,
	output	reg	[3:0]	o_control_btns_posedge
);

	reg 		i_btn_reset_prev;
	reg [3:0]	i_control_btns_prev;
	
	always @(posedge i_clk) begin
		i_btn_reset_prev 			<= i_btn_reset;
		i_control_btns_prev			<= i_control_btns;
		
		o_btn_reset_posedge			<= ~i_btn_reset_prev && i_btn_reset;
		o_control_btns_posedge[0]	<= ~i_control_btns_prev[0] && i_control_btns[0];
		o_control_btns_posedge[1]	<= ~i_control_btns_prev[1] && i_control_btns[1];
		o_control_btns_posedge[2]	<= ~i_control_btns_prev[2] && i_control_btns[2];
		o_control_btns_posedge[3]	<= ~i_control_btns_prev[3] && i_control_btns[3];
	end
	
endmodule