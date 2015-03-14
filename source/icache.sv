/*
  Zejun Yuan / Aiman Md Uslim
  yuan56@purdue.edu

  icache source file
*/

// interface include
//`include "icache_if.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module icache (
	input logic CLK, nRST,
	datapath_cache_if icif,
	cache_control_if ccif
	);
	
	import cpu_types_pkg::*;
	
	icachef_t iaddr;

	typedef enum bit {IDLE, FETCH} StateType;
	StateType curr_state;
	StateType next_state;

	word_t Word_Blk[15:0], next_Word_Blk;

	logic [15:0] Valid;
	logic [25:0] Tag[15:0], nextTag;
	logic nv; // next state valid logic

	//assign icif.ihit = ((Tag[iaddr.idx] == iaddr.tag) && (icif.imemREN == 1'b1))? 1'b1:1'b0;
	assign icif.ihit = ((Tag[iaddr.idx] == iaddr.tag) && (icif.imemREN == 1'b1)) & (Valid[iaddr.idx] == 1) ? ~ccif.iwait:1'b0;
	assign iaddr = icachef_t'(icif.imemaddr);
	int i = 0;
	always_ff @ (posedge CLK, negedge nRST) begin
		if (nRST == 0) begin
			curr_state <= IDLE;
			Valid <= 0;	//????
			for(i = 0; i < 16; i ++) begin
				Tag[i] <= 0;
				Word_Blk[i] <= 0;						
			end
		end
		else begin
			curr_state <= next_state;
			Valid[iaddr.idx] <= nv;
			Word_Blk[iaddr.idx] <= next_Word_Blk;
			Tag[iaddr.idx] <= nextTag;
		end
	end

	always_comb begin

		next_state = curr_state;
		//icif.ramREN = 1'b1;
		ccif.iREN = 1'b1;
		ccif.iaddr= 0;
	
		casez (curr_state)

			FETCH: begin
				ccif.iREN = 1'b1;
				ccif.iaddr = dcif.imemaddr;
				if(ccif.iwait == 0) begin
					next_Word_Blk = ccif.iload[0];
					nv = 1'b1;	
					nextTag = iaddr.tag;
					next_state = IDLE;
				end
				else next_state = FETCH;	
			end
			IDLE: begin
				ccif.iREN = 1'b0;
				icif.imemload = Word_Blk[iaddr.idx];
				if (icif.ihit == 1'b1) begin
					next_state = IDLE;
				end
				else begin
					next_state = FETCH;
				end
			end

		endcase
	end

endmodule
