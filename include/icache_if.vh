/*
  Zejun Yuan / Aiman Md Uslim
  yuan56@purdue.edu

  icache interface
*/

`ifndef ICACHE_IF_VH
`define ICACHE_IF_VH

`include "cpu_types_pkg.vh"

interface icache_if;
	import cpu_types_pkg::*;

	logic		imemREN, ihit, ramREN;
	word_t		iload, iaddr, ramload;
	ramstate_t ramstate;

	modport icache (
		input 	imemREN, iaddr, ramload, ramstate,
		output	iload, ihit, ramREN
	);

	modport ictb (
		input 	iload, ihit, ramREN
		output	imemREN, iaddr, ramload, ramstate
	);

endinterface


`endif