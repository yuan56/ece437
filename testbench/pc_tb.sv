/*
	Zejun Yuan
	yuan56@purdue.edu

	program counter test bench
*/

`include "program_counter_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module pc_tb;
	import cpu_types_pkg::*;

	parameter PERIOD = 10;
    logic CLK = 0, nRST;

	always #(PERIOD/2) CLK++;

	program_counter_if pcif ();
	test PROG (pcif, CLK, nRST);

	`ifndef MAPPED
  	pc DUT(pcif, CLK, nRST);
  	`endif


endmodule

program test

(
	program_counter_if.pc pcif,
	input logic CLK,
	input logic nRST
	);	
	import cpu_types_pkg::*;
	
	parameter PERIOD = 10;
	
	initial begin
	
	$monitor("@%00g PCen = %b, PCnext = %b, PCcurr  %b", $time, pcif.PCen, pcif.PCnext, pcif.PCcurr);
	
	@(posedge CLK);
	$display("PC enable test");

	pcif.PCen = 1'b0;
	pcif.PCnext = 16'hFF00;
	#(PERIOD)

	@(posedge CLK);
	pcif.PCen = 1'b1;
	pcif.PCnext = 16'hCF00;
	#(PERIOD)
	#(PERIOD)

	$finish;
	end

endprogram