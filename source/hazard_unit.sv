/*
	hazard unit block
*/

`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module hazard_unit
(
	hazard_unit_if.hu huif
	);

	import cpu_types_pkg::*;

	i_t itype;
	assign itype = i_t'(huif.iload);
	assign huif.PCen = huif.ihit && !huif.dhit;
	assign huif.iien = (huif.ihit && !huif.dhit);
  	assign huif.ieen =  (huif.ihit || huif.dhit);
  	assign huif.emen = (huif.ihit || huif.dhit);
  	assign huif.mwen = ((huif.ihit || huif.dhit) || (itype.opcode == HALT));
  	assign huif.flush = (huif.iload == 0) || huif.hazard;

 

endmodule
