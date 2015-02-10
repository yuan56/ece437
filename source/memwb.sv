/*
  MEM / WB block
*/

`include "cpu_types_pkg.vh"
`include "memwb_if.vh"

module memwb
(
	input logic CLK,
	input logic nRST,
	memwb_if.mw mwif
	);

	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if (!nRST) begin
			mwif.npc_o <= 0;
			mwif.Jaddr_o <= 0;
			mwif.aluout_o <= 0;
			mwif.extout_o <= 0;
			mwif.MemtoReg_o <= 0;
			mwif.dload_o <= 0;
			mwif.halt_o <= 0;
			mwif.RegWrite_o <= 0;
			mwif.RegDst_o <= 0;
		end
		
		else begin
			mwif.npc_o <= mwif.npc_i;
			mwif.Jaddr_o <= mwif.Jaddr_i;
			mwif.aluout_o <= mwif.aluout_i;
			mwif.extout_o <= mwif.extout_i;
			mwif.MemtoReg_o <= mwif.MemtoReg_i;
			mwif.dload_o <= mwif.dload_i;
			mwif.halt_o <= mwif.halt_i;
			mwif.RegWrite_o <= mwif.RegWrite_i;
			mwif.RegDst_o <= mwif.RegDst_i;
		end
	end

endmodule