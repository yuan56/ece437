/* Aiman Md Uslim and Zejun Yuan

dcache interface file

*/

`ifndef DCACHE_IF_VH
`define DCACHE_IF_VH

`include "cpu_type_pkg.vh"

interface dcache_if;
	import cpu_type_pkg::*;

	logic		dmemREN, dmemWEN, dhit, ramREN, ramWEN;
	word_t		dload, daddr, dstore, ramstore, ramload; 
	ramstate_t ramstate;

	modport dcache (
		input	dmemREN, dmemWEN, daddr, dstore, ramload, ramstate,
		output dload, dhit, ramstore, ramREN, ramWEN
		);

	modport dctb (
		input dload, dhit, ramstore, ramREN, ramWEN,
		output	dmemREN, dmemWEN, daddr, dstore, ramload, ramstate
		);
endinterface


`endif