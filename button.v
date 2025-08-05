////////////////////////////////////////////////////////////////////////////////
//
// Company:			Polytech Students Inovations
// Engineer:        Zelenin Aleksey Aleksandrovich
//
// Create Date:     16:00 4/08/2025
// Design Name:
// Module Name:     button
// Project Name:
// Target Devices:
// Tool versions:
// Description:     debounce
//
////////////////////////////////////////////////////////////////////////////////

module button
	(
		input wire IN,
		input wire CLK,
		output reg OUT
			);
			
			
reg [  20  :  0  ] r_count = 21'h1fffff; // frequency is 50 MHz
reg r_old_data;
reg [   1  :  0  ] r_sync; // for metastability
reg r_flag = 1'b0; // detected change signal


wire w_new_data = r_sync [ 1 ]; // Out of metastability

// Posedge and negedge
assign w_en_flag = ((r_old_data == 1'b1 & w_new_data == 1'b0) | (r_old_data == 1'b0 & w_new_data == 1'b1)) ? 1'b1 : 1'b0;

	//Metastability
	always @(posedge CLK)
	begin
		r_sync [ 0 ] <= IN;
		r_sync [ 1 ] <= r_sync [ 0 ];
	end
	
	//Flag 
	always @(posedge CLK)
		if(w_en_flag & r_count[20])
			r_flag <= 1'b1;
		else if(r_flag)
			r_flag <= 1'b0;
			
	// D-latch
	always @(posedge CLK)
		r_old_data <= w_new_data;
	
	//Counter 
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
