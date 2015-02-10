/*
  IF / ID block
*/

`include "cpu_types_pkg.vh"
`include "ifid_if.vh"

module ifid
(
	input logic CLK,
	input logic nRST,
	ifid_if.ii iiif
	);

	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if (!nRST) begin
			iiif.npc_o <= 0;
			iiif.iload_o <= 0;
		end
		
		else begin
			iiif.npc_o <= iiif.npc_i;
			iiif.iload_o <= iiif.iload_i;
		end
	end

endmodule