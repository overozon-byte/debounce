`timescale 1 ns/1 ns
`default_nettype none


module button_TB;

	reg TB_in = 1'b1;
    reg TB_clk = 1'b1;
	wire TB_out;
	
initial begin
	forever
		#10 
		TB_clk <= ~TB_clk;
end

initial begin
	forever begin
		#1000000000
		TB_in <= ~TB_in;
		#1000000
		TB_in <= ~TB_in;
		#1000000
		TB_in <= ~TB_in;
		#90000000
		TB_in <= ~TB_in;
		#8000000
		TB_in <= ~TB_in;
		#3000000
		TB_in <= ~TB_in;
		#2000000
		TB_in <= ~TB_in;
		#2000000
		TB_in <= ~TB_in;
		#2000000
		TB_in <= ~TB_in;
		#1000000
		TB_in <= ~TB_in;
		end
end



button
    test_button
    (
		.CLK                       (TB_clk),                  
		
        .IN                        (TB_in),        
        .OUT                       (TB_out)            
    );

endmodule