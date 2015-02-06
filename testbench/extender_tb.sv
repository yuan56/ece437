/*
	Zejun Yuan
	yuan56@purdue.edu

	extender test bench
*/
`include "extender_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module extender_tb;
	import cpu_types_pkg::*;
	parameter PERIOD = 10;
    logic CLK = 0;

	always #(PERIOD/2) CLK++;

	extender_if eif ();

	test PROG (eif, CLK);

	`ifndef MAPPED
	extender DUE (eif);
	`endif

	
endmodule

program test
(
	extender_ifext eif,
	input logic CLK
	);
	
	import cpu_types_pkg::*;

	parameter PERIOD = 10;
	initial begin
	$monitor("@%00g ExtSel = %b, imm = %b, extout = %b", $time, eif.ExtSel, eif.imm, eif.extout);

	@(posedge CLK);
	$display("sign-extend test");

	@(posedge CLK);
	eif.ExtSel = 2'b00;
	eif.imm = 16'b1111111100000000;
	#(PERIOD)

	@(posedge CLK);
	eif.ExtSel = 2'b00;
	eif.imm = 16'b0011111100000000;
	#(PERIOD)

	@(posedge CLK);
	$display("zero-extend test");
	@(posedge CLK);
	eif.ExtSel = 2'b01;
	eif.imm = 16'b1111111100000000;
	#(PERIOD)

	@(posedge CLK);
	$display("zero-extend test");
	@(posedge CLK);
	eif.ExtSel = 2'b10;
	eif.imm = 16'b0011111100000000;
	#(PERIOD)

	$finish;
	end

endprogram