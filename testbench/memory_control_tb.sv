// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

//ram interface
`include "cpu_ram_if.vh"

`timescale 1 ns / 1 ns
module memory_control_tb ;

	import cpu_types_pkg::*;

	parameter CPUS = 2;
	parameter PERIOD = 10;
  logic CLK = 0, nRST;

  always #(PERIOD/2) CLK++;

	//inerface
  cache_control_if ccif();
  cpu_ram_if crif();



ram RAM (CLK, nRST, crif);

	//test program
test PROG (CLK, nRST, ccif, crif);
memory_control DUT(CLK, nRST, ccif);


assign crif.ramaddr = ccif.ramaddr;
assign ccif.ramload = crif.ramload;
assign crif.ramstore = ccif.ramstore;
assign ccif.ramstate = crif.ramstate;
assign crif.ramREN = ccif.ramREN;
assign crif.ramWEN = ccif.ramWEN;
endmodule

program test
(
	input logic CLK,
	output logic nRST,
	cache_control_if ccif,
    cpu_ram_if  crif
	);

  parameter PERIOD = 10;
  int i = 0;

	import cpu_types_pkg::*;
  
	initial begin


	nRST = 1'b0;
      $display("rset");
    #(PERIOD)
	//@(posedge CLK);
    nRST = 1'b1;
    #(PERIOD)

    //@(posedge CLK);
    $display("Instruction Fetch Test");

    ccif.iREN[0] = 1'b1;
    ccif.dREN[0] = 1'b0;
    ccif.dWEN[0] = 1'b0;
    ccif.dstore[0] = 32'b0;
    ccif.daddr[0] = 32'b0;
    ccif.iaddr[0] = 32'h0000;



    for (i = 0; i <= 31; i++) begin
      
      @(negedge ccif.iwait[0]);
      if (ccif.iload[0] == ccif.ramload) begin
        $display("Instruction Fetch Test PASSED!\n");
      end
      else begin
        $error("Instructino Fetch Test FAILED!\n");
      end
      
      #(PERIOD)
      ccif.iaddr[0] = ccif.iaddr[0]  + 4;


    end


    $display("Read Priority Test");

    ccif.iREN[0] = 1'b1;
    ccif.dREN[0] = 1'b1;
    ccif.dWEN[0] = 1'b0;
    ccif.dstore[0] = 32'h0000;
    ccif.daddr[0] = 32'h0000;
    ccif.iaddr[0] = 32'h0000;



    for (i = 0; i <= 31; i++)  begin


      ccif.dREN[0] = 1'b1;
      @(negedge ccif.dwait[0]);
      if (ccif.dload[0] == ccif.ramload) begin
        $display("Read Priority Test PASSED!\n");
      end
      else begin
        $error("Read Priority Test FAILED!\n");
      end

      ccif.dREN[0] = 1'b0;
      @(negedge ccif.iwait[0]);
      if (ccif.iload[0] == ccif.ramload) begin
        $display("Read Priority Test PASSED!\n");
      end
      else begin
        $error("Read Priority Test FAILED!\n");
      end
      
      #(PERIOD)
      ccif.iaddr[0] = ccif.iaddr[0] + 4;
      ccif.daddr[0] = ccif.daddr[0] + 4;
      
    end


    $display("Write data Test");

    ccif.iREN[0] = 1'b1;
    ccif.dREN[0] = 1'b0;
    ccif.dWEN[0] = 1'b1;
    ccif.dstore[0] = 32'h0000;
    ccif.daddr[0] = 32'h0000;
    ccif.iaddr[0] = 32'h0000;



    for (i = 0; i <= 31; i++) begin 
    ccif.dstore[0] = i;

      ccif.dWEN[0] = 1'b1;
      @(negedge ccif.dwait[0]);
      if (ccif.dload[0] == ccif.ramload) begin
        $display("Write data Test PASSED!\n");
      end
      else begin
        $error("Write data Test FAILED!\n");
      end

      #(PERIOD)
      ccif.dWEN[0] = 1'b0;
      @(negedge ccif.iwait[0]);
      if (ccif.iload[0] == ccif.ramload) begin
        $display("Write data Test PASSED!\n");
      end
      else begin
        $error("Write data Test FAILED!\n");
      end
      
      #(PERIOD)
      ccif.iaddr[0] = ccif.iaddr[0] + 4;
      ccif.daddr[0] = ccif.daddr[0] + 4;
      ccif.dstore[0] = ccif.dstore[0] << 1;
      
    end
    dump_memory();
    $finish;



	end

  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    //ccif.tbCTRL = 1;
    ccif.daddr[0] = 0;
    ccif.dWEN[0] = 0;
    ccif.dREN[0] = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      ccif.daddr[0] = i << 2;
      ccif.dREN[0] = 1;
      repeat (4) @(posedge CLK);
      if (ccif.dload[0] === 0)
        continue;
      values = {8'h04,16'(i),8'h00,ccif.ramload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),ccif.ramload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      ccif.dREN[0] = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask

endprogram 


//endprogram
