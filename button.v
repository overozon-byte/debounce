module button
	(
		input wire IN,
		input wire CLK,
		output reg OUT
			);
			
			
reg [  20  :  0  ] r_count = 21'h1fffff;
reg r_old_data;
reg [   1  :  0  ] r_sync;
reg r_flag = 1'b0; // detected change signal

wire w_new_data = r_sync [ 1 ];

assign w_en_flag = ((r_old_data == 1'b1 & w_new_data == 1'b0) | (r_old_data == 1'b0 & w_new_data == 1'b1)) ? 1'b1 : 1'b0;

	always @(posedge CLK)
	begin
		r_sync [ 0 ] <= IN;
		r_sync [ 1 ] <= r_sync [ 0 ];
	end
	
	always @(posedge CLK)
		if(w_en_flag & r_count[20])
			r_flag <= 1'b1;
		else if(r_flag)
			r_flag <= 1'b0;

	always @(posedge CLK)
		r_old_data <= w_new_data;
	
	always @(posedge CLK)
	begin
		if(r_flag) begin
			r_count <= 21'd499999;
			OUT <= w_new_data;
		end
		else begin
		if(~r_count[ 20 ])
			r_count <= r_count - 1'd1;		
		else OUT <= w_new_data;
		end
	end
	
endmodule
