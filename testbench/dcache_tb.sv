/*
  Zejun Yuan / Aiman Md Uslim
  yuan56@purdue.edu

  dcache test bench
*/

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"
`timescale 1 ns / 1 ps

module dcache_tb;

	import cpu_types_pkg::*;

	parameter PERIOD = 20;
	logic CLK = 0;
	logic CPUCLK = 0;
	logic nRST;

	always #(PERIOD/2) CLK++;
	always #(PERIOD) CPUCLK++;
	//interface
	datapath_cache_if dcif ();
	cache_control_if ccif ();
	cpu_ram_if crif ();

  test PROG (CLK, nRST, ccif, crif, dcif);
	ram RAM (CLK, nRST, crif);
	memory_control MC (CPUCLK, nRST, ccif);
	dcache DUT (CPUCLK, nRST, dcif, ccif);

	assign crif.ramaddr = ccif.ramaddr;
	assign ccif.ramload = crif.ramload;
	assign crif.ramstore = ccif.ramstore;
	assign ccif.ramstate = crif.ramstate;
	assign crif.ramREN = ccif.ramREN;
	assign crif.ramWEN = ccif.ramWEN;
  //assign ccif.ramaddr = ccif.iaddr;
endmodule

// _____________________________ START TESTING ____________________________________//

program test
(
	input logic CLK,
	output logic nRST,
	cache_control_if ccif,
    cpu_ram_if  crif,
    datapath_cache_if dcif
	);

  	int i = 0;

	import cpu_types_pkg::*;
  parameter PERIOD = 20;
	initial begin


	nRST = 1'b0;
    $display("reset");
    #(PERIOD);
	//@(posedge CLK);
    nRST = 1'b1;
    ccif.iREN = 0;
    
    #(PERIOD);
    


   	$display("First fetch");
  	dcif.dmemaddr = 32'h0000;
    dcif.dmemREN = 1;
    #(2 * PERIOD);
    for(i = 0; i < 32; i++) begin 
      #(2 * PERIOD);
  		dcif.dmemaddr += 32'h4;
      #(2 * PERIOD);
  		if(dcif.ihit == 1) $display("hit\n ");
      #(2 * PERIOD);
      dcif.dmemaddr = (i >= 15) ? 32'h0000 : dcif.dmemaddr;
	 end
 
    //dump_memory();
    $finish;
	end

  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    //ccif.tbCTRL = 1;
    ccif.iaddr[0] = 0;
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

      ccif.iaddr[0] = i << 2;
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