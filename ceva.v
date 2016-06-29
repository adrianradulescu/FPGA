`timescale 1ns / 1ps
module incercare(input clk,
					  input fclk,
					  output reg ok = 0
					  );			  
	reg [3:0] counter = 0;
	
	always @ (negedge clk) begin
		if((!clk) & (counter != 4'b1011)) counter <= counter + 1;
		if(counter == 4'b1011) begin
			counter <= 4'b0000;
			ok <= 1;
		end else ok <= 0;
	
	end
						

endmodule


module test_counter();
	reg clk;
	reg fclk;
	wire counter_check;
	
	incercare mymodule (.clk(clk), .fclk(fclk), .ok(counter_check));
	
	initial begin
	fclk = 0;
	forever #5 fclk = ~fclk;
	end
	
	initial begin
	clk = 0;
	forever #20 clk = ~clk;
	end


endmodule