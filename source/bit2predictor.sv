// 2 bit saturating branch predictor
// Aiman Md Uslim

`include "cpu_types_pkg.vh"

`include "bit2predictor_if.vh"

module bit2predictor (
		      input logic CLK,
		      input logic nRST,
		      bit2predictor_if.twobit twobit_if
		      );
   import cpu_types_pkg::*;
   typedef enum logic[2:0] {TAKE, LEAVE, FAULTED_TAKE, FAULTED_LEAVE} bit2_t;
   
   
   bit2_t predict, npredict;
   
   
   always_ff @ (posedge CLK, negedge nRST)  begin
      if(!nRST) predict <= TAKE;
      else predict <= npredict;
   end

   assign twobit_if.decision = (predict == TAKE || predict == LEAVE) ? 1 : 0;
   assign twobit_if.predictor_flush = twobit_if.wrong_decision;
      
   always_comb begin
      case(predict)
	TAKE: if(!twobit_if.wrong_decision) npredict = FAULTED_TAKE;
	else npredict = TAKE;
	LEAVE: if(twobit_if.wrong_decision) npredict = FAULTED_LEAVE;
	else npredict = LEAVE;
	FAULTED_TAKE: if(!twobit_if.wrong_decision) npredict = LEAVE;
	else npredict = FAULTED_TAKE;
	FAULTED_LEAVE: if(twobit_if.wrong_decision) npredict = TAKE;
	else npredict = FAULTED_LEAVE;
	default: npredict = predict;
      endcase // case (predict)
   end // always_comb
   
endmodule
	
	
	 
   
