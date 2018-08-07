#####################################
# Author : Venkatesh Jaligam
# Revision : 1.0
#####################################

`timescale 1ns/ 1ps

module clock_divider (input clk, rst, output reg clk_div);

reg [1:0] tmp;
always @(posedge clk, posedge rst)
	begin
		if (rst)
			tmp <= 2'b0;
		else 
			tmp <= tmp + 1;
	end


always @ (posedge clk, posedge rst)
	begin
		if (rst)
			clk_div <= 1'b0;
		else if (tmp == 11)
			clk_div <= ~clk_div;
		else
			clk_div <= clk_div;
	end


endmodule


