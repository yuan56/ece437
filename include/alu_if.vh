`ifndef ALU_IF_VH
`define ALU_IF_VH

`include "cpu_types_pkg.vh"

interface alu_if;

	import cpu_types_pkg::*;

	logic nflag, vflag, zflag;
	word_t portA, portB, outport;
	aluop_t aluop;

	modport rf (
		input portA, portB, aluop,
		output outport, nflag, vflag, zflag
		);

	modport tb (
		input outport, nflag, vflag, zflag,
		output portA, portB, aluop		
		);

endinterface

`endif