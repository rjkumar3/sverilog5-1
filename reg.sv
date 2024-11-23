`timescale 1ns / 100ps

module register(clk, rst, ena, data, r);

output	[7:0] r;
input clk, rst, ena;
input	[7:0] data;
wire	[7:0] i;
wire	[7:0] r_bar;

	dff d0(r[0], r_bar[0], clk, i[0], rst);
	dff d1(r[1], r_bar[1], clk, i[1], rst);
	dff d2(r[2], r_bar[2], clk, i[2], rst);
	dff d3(r[3], r_bar[3], clk, i[3], rst);
	dff d4(r[4], r_bar[4], clk, i[4], rst);
	dff d5(r[5], r_bar[5], clk, i[5], rst);
	dff d6(r[6], r_bar[6], clk, i[6], rst);
	dff d7(r[7], r_bar[7], clk, i[7], rst);
		//OUT, A, B, SEL
	MUX2_1 M0(i[0], r[0], data[0], ena);
	MUX2_1 M1(i[1], r[1], data[1], ena);
	MUX2_1 M2(i[2], r[2], data[2], ena);
	MUX2_1 M3(i[3], r[3], data[3], ena);
	MUX2_1 M4(i[4], r[4], data[4], ena);
	MUX2_1 M5(i[5], r[5], data[5], ena);
	MUX2_1 M6(i[6], r[6], data[6], ena);
	MUX2_1 M7(i[7], r[7], data[7], ena);
endmodule

