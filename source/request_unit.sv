/*
	Zejun Yuan
	yuan56@purdue.edu

	request unit block

*/

`ifndef REQUEST_UNIT_VH
`define REQUEST_UNIT_VH

module request_unit (
	input logic CLK,
	input logic nRST,
	request_unit_if.qu quif
	);

	import cpu_types_pkg::*;
   assign quif.PCen = quif.ihit && !quif.dhit;

  	assign quif.iREN = 1;
  	
	always_ff @(posedge CLK or negedge nRST) begin
		if (!nRST) begin
			quif.dREN <= 1'b0;
			quif.dWEN <= 1'b0;
			//quif.iREN <= 1'b1;
		end

		else begin
			//quif.iREN <= 1'b1;
			if (quif.ihit) begin
				quif.dREN <= quif.DRen;
				quif.dWEN <= quif.DWen;
			end
			else if (quif.dhit) begin
				quif.dREN <= 0;
				quif.dWEN <= 0;
			end
		end

	end

endmodule

`endif
