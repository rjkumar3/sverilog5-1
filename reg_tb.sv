`timescale 1ns / 1ns
`define PULSE #50

module reg_tb();

	reg clk, ena, rst;
	reg [7:0] data;
	wire [7:0] r;
		//clk, rst, ena, data, r
	register UUT(clk, rst, ena, data, r);

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		ena = 1'b0;

		#50 rst = 1'b1;
		#100 ena = 1'b1;

		#300 $finish;
	end

always `PULSE clk = ~clk;

always @(posedge clk)
	$monitor("%d r = %b, clk = %b", $time, r, clk);
	initial begin
		$vcdpluson;
			data[0] = 1'b1;
			data[1] = 1'b1;
			data[2] = 1'b0;
			data[3] = 1'b0;
			data[4] = 1'b1;
			data[5] = 1'b0;
			data[6] = 1'b1;
			data[7] = 1'b0;
		$display("%d data = %b", $time, data);
		$display("%d r = %b", $time, r);
	end
endmodule

