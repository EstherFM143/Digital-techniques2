import fsmd_pkg::*;

module fsmd_tb;
   logic 	      clk;
   logic 	      srst;
   logic [15:0]       ext_in;
   logic [15:0]       ext_out; 
   logic 	      ready_out;
   logic 	      done_out;   
   
   fsmd DUT (.*);
   fsmd_test TEST (.*);
   
   always
     begin
	if (clk != '1)
	  clk = '1;
	else
	  clk = '0;
	#5ns;
     end

   initial
     begin
	srst = '1;
	@(negedge clk);
	@(negedge clk);	
	srst = '0;
     end

   initial
     begin
	int file;
	file = $fopen("reports/fsmd_simulation.txt", "w");

	wait (!srst);
	$fdisplay(file, "===========================================================================================================================");
	$fdisplay(file, "  FSM  |         CONTROL WORD         |                    REGISTERS                     |            BUSES         | FLAGS");
	
	$fdisplay(file, "---------------------------------------------------------------------------------------------------------------------------");
	
	$fdisplay(file, "ST NS  | we rsel asel bsel dsel  fsel |    R0    R1    R2    R3    R4    R5    R6    R7  |  busa  busb   alu  busd  | z n ");
	$fdisplay(file, "===========================================================================================================================");
	
	forever
	  begin
	     @(posedge clk iff srst == '0)
	       $fdisplay(file, "%2d %2d  |  %1b  %3s  %3s  %3s  %3s  %4s | %5d %5d %5d %5d %5d %5d %5d %5d  | %5d %5d %5d %5d  | %1b %1b", 
			DUT.FSM.state_r ,
			DUT.FSM.next_state ,
			DUT.we,															
			DUT.rsel.name(),
			DUT.asel.name(),
			DUT.bsel.name(),
			DUT.dsel.name(),
			DUT.fsel.name(),
			DUT.DATAPATH.rb_r[0],
			DUT.DATAPATH.rb_r[1],
			DUT.DATAPATH.rb_r[2],
			DUT.DATAPATH.rb_r[3],
			DUT.DATAPATH.rb_r[4],
			DUT.DATAPATH.rb_r[5],
			DUT.DATAPATH.rb_r[6],
			DUT.DATAPATH.rb_r[7],
			DUT.DATAPATH.busa,
			DUT.DATAPATH.busb,
			DUT.DATAPATH.alu,									 
			DUT.DATAPATH.busd,	
			DUT.z,
			DUT.n
			);
	  end
     end
  

endmodule
