/*
	Zejun Yuan
	yuan56@purdue.edu

	request unit test bench
*/

`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns

module request_unit_tb;
	import cpu_types_pkg::*;

	parameter PERIOD = 10;
    logic CLK = 0, nRST;

	always #(PERIOD/2) CLK++;

	//interface
	request_unit_if quif ();

	test PROG (quif, CLK, nRST);

	`ifndef MAPPED
	request_unit DUT (quif, CLK, nRST);
	`endif


endmodule

program test
(
	request_unit_if.qu quif,
	input logic CLK,
	input logic nRST
	);

	parameter PERIOD = 10;

	initial begin
		$display("reset test");
		nRST = 1'b1;
		$finish;
	end
endprogram
