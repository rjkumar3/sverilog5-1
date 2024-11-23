`timescale 1ns / 1ns

`define PRIMARY_OUT 	2
`define FAN_OUT_1	0.5
`define FAN_OUT_2	0.8
`define FAN_OUT_3	1
`define TIME_DELAY_1	3
`define TIME_DELAY_2	4
`define TIME_DELAY_3	5

module MUX2_1(OUT, A, B, SEL);
	output OUT;
	input A, B, SEL;

	wire A1, B1, SEL_N;

	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT1(SEL_N, SEL);
	not #(`TIME_DELAY_2 + `FAN_OUT_1) AND1(A1, A, SEL_N);
	not #(`TIME_DELAY_2 + `FAN_OUT_1) AND2(B1, B, SEL);
	or #(`TIME_DELAY_2 + `FAN_OUT_1) OR(OUT, A1, B1);
endmodule
