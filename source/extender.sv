/*
	Zejun Yuan	
	yuan56@purdue.edu

	extender 

*/


`include "extender_if.vh"

module extender (
	extender_if.ext eif
	);

always_comb begin
	casez (eif.ExtSel)
		2'b00: 				//sign-extend
			if (eif.imm[15] == 1'b1) begin
				eif.extout = {16'b1111111111111111, eif.imm};
			end

			else begin
				eif.extout = {16'b0000000000000000, eif.imm};

			end
		2'b01:				//zero-extend
			eif.extout = {16'b0000000000000000, eif.imm};

		2'b10:
			eif.extout = {eif.imm, 16'b0000000000000000};

		default:  			//default is zero-extend
			eif.extout = {16'b0000000000000000, eif.imm};

	endcase
end

endmodule

