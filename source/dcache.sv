/* Aiman Md Uslim / Zejun Yuan

dcache source file
*/

// interface module
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module dcache (
	input logic CLK, nRST,
	datapath_cache_if dcif,
	cache_control_if ccif
	);
	import cpu_types_pkg::*;
	typedef enum bit [3:0] {IDLE, HIT_WRITE, HIT_READ, MISS_READ1, MISS_READ2, REPLACE_WRITE1, REPLACE_WRITE2, WRITE_CACHE} StateType;
	StateType curr_state;
	StateType next_state;

	dcachef_t daddr;

	word_t Blk1_Word1[7:0];
	word_t Blk1_Word2[7:0];
	word_t Blk2_Word1[7:0];
	word_t Blk2_Word2[7:0];

	logic Blk1_Valid[7:0];
	logic Blk2_Valid[7:0];
	logic Blk1_Dirty[7:0];
	logic Blk2_Dirty[7:0];
	logic Blk1_mru[7:0];
	logic Blk2_mru[7:0];

	logic [25:0] Blk1_Tag[7:0];
	logic [25:0] Blk2_Tag[7:0];
	logic dhit, blk1en, blk2en, word1en, word2en;

	assign blk1en = (Blk1_Tag[daddr.idx] == daddr.tag);
	assign blk2en = (Blk2_Tag[daddr.idx] == daddr.tag);
	assign word1en = (daddr.blkoff == 0);
	assign word2en = (daddr.blkoff == 1);
	assign dcif.dhit = ((Blk1_Tag[daddr.idx] == daddr.tag && Blk1_Valid[daddr.idx] == 1) || (Blk2_Tag[daddr.idx] == daddr.tag && Blk2_Valid[daddr.idx] == 1)) ? 1'b1 : 1'b0;
	assign daddr = dcachef_t'(dcif.dmemaddr);
	assign dhit = dcif.dhit;

	// WB address
	word_t WBaddr;


	// next state variables for each of the modified bits
	logic valid1, valid2, nmru1, nmru2, ndirty1, ndirty2;
	logic [25:0] nextTag1, nextTag2;
	word_t nextword;

	// enable signals for modification of data (word) in cache
	logic writeb1w1, writeb1w2, writeb2w1, writeb2w2;


	int i = 0;
	always_ff @ (posedge CLK, negedge nRST) begin
		if (nRST == 0) begin
			curr_state <= IDLE;
			for(i = 0; i < 8; i++) begin
				Blk1_Valid[i] <= 0;
				Blk2_Valid[i] <= 0;
				Blk1_Dirty[i] <= 0;
				Blk2_Dirty[i] <= 0;
				Blk1_mru[i] <= 0;
				Blk2_mru[i] <= 0;
				Blk1_Word1[i] <= 0;
				Blk1_Word2[i] <= 0;
				Blk2_Word1[i] <= 0;
				Blk2_Word2[i] <= 0;
				Blk1_Tag[i] <= 0;
				Blk2_Tag[i] <= 0;
			end
		end
		else begin
			curr_state <= next_state;
			Blk1_Valid[daddr.idx] <= valid1; 
			Blk2_Valid[daddr.idx] <= valid2;
			Blk1_mru[daddr.idx] <= nmru1; // one has to be used more recently than the other
			Blk2_mru[daddr.idx] <= nmru2;
			Blk1_Dirty[daddr.idx] <= ndirty1;
			Blk2_Dirty[daddr.idx] <= ndirty2;
                        Blk1_Tag[daddr.idx] <= nextTag1;
		        Blk2_Tag[daddr.idx] <= nextTag2;
		   
		   
			// Now block word, but only for writing
			Blk1_Word1[daddr.idx] <= (writeb1w1) ? nextword : Blk1_Word1[daddr.idx];
			Blk1_Word2[daddr.idx] <= (writeb1w2) ? nextword : Blk1_Word2[daddr.idx];
			Blk2_Word1[daddr.idx] <= (writeb2w1) ? nextword : Blk2_Word1[daddr.idx];
			Blk2_Word2[daddr.idx] <= (writeb2w2) ? nextword : Blk2_Word2[daddr.idx];
		   
		  

		end
	end

	// NEXT STATE LOGIC
	always_comb begin
		//next_state = curr_state;
		//dcif.ram
		casez (curr_state)
			IDLE: begin
				if (dcif.dmemREN == 1'b1) begin
					next_state = HIT_READ;
				end
				else if (dcif.dmemWEN == 1'b1) begin
					next_state = HIT_WRITE;
				end
				else begin
					next_state = IDLE;
				end
			end

			HIT_READ: begin
				if (dhit == 1'b1) begin
					next_state = IDLE;
				end
				else if (dhit == 1'b0) begin
					next_state = MISS_READ1;
				end
				else begin
					next_state = HIT_READ;
				end
			end
			HIT_WRITE: begin
				if (dhit == 1'b1) begin
					next_state = IDLE;
				end
				else if ((dhit == 1'b0) & (Blk1_Dirty[daddr.idx] == 1 || Blk2_Dirty[daddr.idx] == 1)) begin 
					next_state = REPLACE_WRITE1;
				end
				else if ((dhit == 1'b0) && (Blk1_Dirty[daddr.idx] == 1'b0) && (Blk2_Dirty[daddr.idx] == 1'b0)) begin
					next_state = WRITE_CACHE; // WRITE TO CACHE, AND TAG, REPLACING WITH LRU
				end
				else begin
					next_state = HIT_WRITE;
				end
			end
			MISS_READ1: begin
				if (ccif.dwait == 0) begin
					next_state = MISS_READ2;
				end
				else begin
					next_state = MISS_READ1;
				end
			end

			MISS_READ2: begin
				if (ccif.dwait == 0) begin
					next_state = IDLE;
				end
				else begin
					next_state = MISS_READ2;
				end
			end

			REPLACE_WRITE1: begin
				if (ccif.dwait == 0) begin
					next_state = REPLACE_WRITE2;
				end
				else begin
					next_state = REPLACE_WRITE1;
				end
			end

			REPLACE_WRITE2: begin
				if (ccif.dwait == 0) begin
					next_state = WRITE_CACHE;
				end
				else begin
					next_state = REPLACE_WRITE2;
				end
			end

			WRITE_CACHE: begin
				if (dhit == 1'b1) begin
					next_state = IDLE;
				end
				else begin
					next_state = WRITE_CACHE;
				end
			end
			default: next_state = IDLE;
		endcase
	end

	// OUTPUT LOGIC
always_comb begin
	/* INITIALIZE the next state variables
		// next state variables for each of the modified bits
		logic valid1, valid2, nmru1, nmru2, ndirty1, ndirty2;
		logic [25:0] nextTag1. nextTag2;
		(remember to not modify these variables if its a miss!)
		*/
		nextTag1 = Blk1_Tag[daddr.idx];
		nextTag2 =  Blk2_Tag[daddr.idx];
		nmru1 = Blk1_mru[daddr.idx];
		nmru2 = Blk2_mru[daddr.idx];
		ndirty1 = Blk1_Dirty[daddr.idx];
		ndirty2 = Blk2_Dirty[daddr.idx];
		valid1 = Blk1_Valid[daddr.idx];
		valid2 = Blk2_Valid[daddr.idx];

		// initialize enables for words
		writeb1w1 = 0;
		writeb1w2 = 0;
		writeb2w1 = 0;
		writeb2w2 = 0;
		casez(curr_state)	
			IDLE: begin
				dcif.dmemload = 0;
				ccif.dstore = 0;
				ccif.dREN = 0;
				ccif.dWEN = 0;				
				ccif.daddr = 0;
			end
			HIT_WRITE: begin
				if(dhit) begin
					nextword = dcif.dmemstore;
					writeb1w1 = (blk1en && word1en);
					writeb1w2 = (blk1en && word2en);
					writeb2w1 = (blk2en && word1en);
					writeb2w2 = (blk2en && word2en);
				end
			end
			// addresses at which to write back is based on the block being replaced, not the address that is coming from the datapath.
			REPLACE_WRITE1:	begin
				// 1st: the tag doesn't match for any of the two blocks (index has already been mapped)
				// 2nd: replacement policy: replace LRU (MRU = 0)
				// 3rd: write onto memory using the address based on the block
				ccif.dWEN = 1;
				if(Blk1_mru[daddr.idx] == 0) begin
					ccif.dstore = Blk1_Word1[daddr.idx];
					ccif.daddr = {Blk1_Tag, daddr.idx, '0};
				end
				else begin
					ccif.dstore = Blk2_Word1[daddr.idx];
					ccif.daddr = {Blk2_Tag, daddr.idx, '0};
				end
			end
			REPLACE_WRITE2: begin
				ccif.dWEN = 1;
				if(Blk1_mru[daddr.idx] == 0) begin
					ccif.dstore = Blk1_Word2[daddr.idx];
					ccif.daddr = {Blk1_Tag[daddr.idx], daddr.idx, '0} + 32'h4; // offset by 1 address location for writing the second word
				end
				else begin	
					ccif.dstore = Blk2_Word2[daddr.idx];
					ccif.daddr = {Blk1_Tag[daddr.idx], daddr.idx, '0} + 32'h4;
				end
			end
			WRITE_CACHE: begin // only when dhit == 0
				nextword = dcif.dmemstore; 
				// enable write on the correct word depending on which block was replaced.
				if(Blk1_mru[daddr.idx] == 0) begin
					writeb1w1 = word1en;
					writeb1w2 = word2en;
				end
				else begin
					writeb2w1 = word1en;
					writeb2w2 = word2en;
				end
				/*
				if(Blk1_mru[daddr.idx] == 0) begin	
					Blk1_Tag[daddr.idx] = daddr.tag;
					Blk1_Dirty[daddr.idx] = 1;
					if (daddr.blkoff == 1'b0) begin
						Blk1_Word1[daddr.idx] = dcif.dmemstore;
					end
					else begin
						Blk1_Word2[daddr.idx] =  dcif.dmemstore;
					end
					Blk1_mru[daddr.idx] = 1;
					Blk2_mru[daddr.idx] = 0;
				end
				else begin
					Blk2_Tag[daddr.idx] = daddr.tag;
					Blk2_Dirty[daddr.idx] = 1;
					if (daddr.blkoff == 1'b0) begin
						Blk2_Word1[daddr.idx] = dcif.dmemstore;
					end
					else begin
						Blk2_Word2[daddr.idx] =  dcif.dmemstore;
					end
					Blk2_mru[daddr.idx] = 1;
					Blk1_mru[daddr.idx] = 0;
				end*/
			end
			HIT_READ: begin
				if(dhit) begin
					casez ({blk1en, blk2en, word1en, word2en})
						4'b1010: dcif.dmemload = Blk1_Word1[daddr.idx];
						4'b1001: dcif.dmemload = Blk1_Word2[daddr.idx];
						4'b0110: dcif.dmemload = Blk2_Word1[daddr.idx];
						4'b0101: dcif.dmemload = Blk2_Word2[daddr.idx];
					endcase
				end
				/*
				if(Blk1_Tag[daddr.idx] == daddr.tag) begin
					Blk1_mru[daddr.idx] = 1;
					Blk2_mru[daddr.idx] = 0;

					if(daddr.blkoff == 0) dcif.dmemload = Blk1_Word1[daddr.idx];
					else dcif.dmemload = Blk1_Word1[daddr.idx];

				end
				else if(Blk2_Tag[daddr.idx] == daddr.tag)begin
					Blk2_mru[daddr.idx] = 1;
					Blk1_mru[daddr.idx] = 0;

					if(daddr.blkoff == 0) dcif.dmemload = Blk1_Word1[daddr.idx];
					else dcif.dmemload = Blk1_Word1[daddr.idx];
				end
				else begin
					// if its not a hit
				end*/
			end
			MISS_READ1: begin// for word 1
				ccif.dREN = 1;
				ccif.daddr = dcif.dmemaddr;
				nextword = ccif.dload;
				if(Blk1_mru[daddr.idx] == 0 && Blk1_Valid[daddr.idx] == 0) begin
				   nextTag1 = daddr.tag;
				   writeb1w1 = 1;
				   nmru1 = 1;
				   nmru2 = 0;
				   valid1 = 1;
				end
				else begin // place second block
				   nextTag2 = daddr.tag;
				   writeb2w1 = 1;
				   nmru2 = 1;
				   nmru1 = 0;
				   valid2 = 1;
				end
			end
			MISS_READ2: begin // for word 2 
				ccif.dREN = 1;
				ccif.daddr = dcif.dmemaddr + 4;
				nextword = ccif.dload;
				if(Blk1_mru[daddr.idx] == 1) begin
				   nextTag1 = daddr.tag;
				   writeb1w2 = 1;
				   nmru1 = 1;
				   nmru2 = 0;
				   valid1 = 1;
				end
				else begin // place second block
				   nextTag2 = daddr.tag;
				   writeb2w2 = 1;
				   nmru2 = 1;
				   nmru1 = 0;
				   valid2 = 1;
				end
			end	
		endcase
	end


endmodule