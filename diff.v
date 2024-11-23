`timescale 1ns / 100ps

`define PRIMARY_OUT	2
`define FAN_OUT_1	0.5
`define FAN_OUT_2	0.8
`define FAN_OUT_3	1
`define TIME_DELAY_1	3
`define TIME_DELAY_2	4
`define TIME_DELAY_3	5

module dff(q, qbar,clock, data, clear);
	input clock, data, clear;
	output q, qbar;

	wire s, sbar, r, rbar, clkbar, cbar, dbar, clock, clear, data, clr, clk, d;

	not #(`TIME_DELAY_1 + `FAN_OUT_1) N1(cbar, clear);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) N2(clkbar, clock);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) N3(dbar, data);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) N4(clr, cbar);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) N5(clk, clkbar);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) N6(d, dbar);

	SR_Latch2 s1(s, sbar, clr, clk, 1'b1, rbar);
	SR_Latch2 s2(r, rbar, s, clk, clr, d);
	SR_Latch2 s3(q, qbar, s, 1'b1, clr, r);
endmodule
