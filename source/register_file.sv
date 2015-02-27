//`include "register_file_if.vh"
`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

 

module register_file
   import cpu_types_pkg::*;

(
    input logic CLK,
    input logic nRST,
    register_file_if.rf rfif
);

    word_t Reg_Arr[31:0];

    assign rfif.rdat1 = Reg_Arr[rfif.rsel1];
    assign rfif.rdat2 = Reg_Arr[rfif.rsel2];

    always_ff @(negedge CLK or negedge nRST) begin
        
        if (!nRST) begin
            Reg_Arr <= '{default:0};
                 
        end

        else begin
             if ((rfif.WEN == 1'b1) && (rfif.wsel != 5'b00000)) begin
                Reg_Arr[rfif.wsel] <= rfif.wdat;
            end  
            
        end
    end



endmodule