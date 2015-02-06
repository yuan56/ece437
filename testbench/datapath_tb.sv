/*
	Zejun Yuan
	yuan56@purdue.edu

  system test bench, for connected processor (datapath+cache)
  and memory (ram).

*/

`include "datapath_cache_if.vh"
`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns

module datapath_tb;
	// clock period
  	parameter PERIOD = 20;

  	// signals
  	logic CLK = 1, nRST;

  	// clock
  	always #(PERIOD/2) CLK++;

  	datapath_cache_if dpif();
  	test PROG (dpif, CLK);

  	`ifndef MAPPED
  	datapath DUT(dpif);
  	`endif

endmodule

program test
(
	datapath_cache_if.dp dpif,
	input logic CLK
	);

	import cpu_types_pkg::*;

	parameter PERIOD = 10;


	initial begin


	$finish
	end
endprogram