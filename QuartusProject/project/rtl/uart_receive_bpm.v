module uart_receive_bpm(
	input 				i_clk,
	input 				i_reset,			
	input 				i_uart_rx,			
	output reg 			o_from_uart_ready,
	output reg 	[31:0] 	o_bpm_count
);
	wire from_uart_valid;
	wire [7:0] from_uart_data;
	uart_rx #(.CLKS_PER_BIT(87)) UART_RX_INST (
		.i_Clock(i_clk),
		.i_Rx_Serial(i_uart_rx),
		.o_Rx_DV(from_uart_valid),
		.o_Rx_Byte(from_uart_data)
    );
	
	// read state machine
	parameter UART_READY_READ 		= 8'd0; 	
	parameter UART_READ_SOM 		= 8'd1; // SOM - Start of message
	parameter UART_READ_BPM_31_24	= 8'd3;
	parameter UART_READ_BPM_23_16 	= 8'd4;
	parameter UART_READ_BPM_15_8 	= 8'd5;
	parameter UART_READ_BPM_7_0 	= 8'd6;
	parameter UART_READ_EOM 		= 8'd7; // EOM - End of message
	
	parameter UART_SOM 				= 8'b01110011; // 's'
	parameter UART_EOM 				= 8'b01100101; // 'e'
	
	reg [2:0] readState;
	
	always @(posedge i_clk) begin
		if (i_reset) begin
			o_from_uart_ready 	<= 0;
			o_bpm_count 		<= 0;
			readState	<= UART_READY_READ;
		end else begin
			if (readState == UART_READY_READ) begin
				o_from_uart_ready <= 0;
				readState <= UART_READ_SOM;
			end else if (from_uart_valid) begin
					if (readState == UART_READ_SOM) begin
						readState <= (from_uart_data == UART_SOM) ? UART_READ_BPM_31_24 : UART_READY_READ; /* handle error */
					end else if (readState == UART_READ_BPM_31_24) begin
						o_bpm_count[31:24] <= from_uart_data;	
						readState <= UART_READ_BPM_23_16;
					end else if (readState == UART_READ_BPM_23_16) begin
						o_bpm_count[23:16] <= from_uart_data;
						readState <= UART_READ_BPM_15_8;
					end else if (readState == UART_READ_BPM_15_8) begin
						o_bpm_count[15:8] <= from_uart_data;
						readState <= UART_READ_BPM_7_0;
					end else if (readState == UART_READ_BPM_7_0) begin
						o_bpm_count[7:0]  <= from_uart_data;
						readState <= UART_READ_EOM;
					end else if (readState == UART_READ_EOM) begin
						o_from_uart_ready <= (from_uart_data == UART_EOM) ? 1: 0; /* handle error */
						readState <= UART_READY_READ;
					end
			end else;
		end
	end
	
endmodule