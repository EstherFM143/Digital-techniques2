program ctr_test
  #( parameter int BITS = 3 )  
   (input logic        clk,
    input logic 	    rst_n,
    output logic [1:0] 	    mode_in,
    output logic [BITS-1:0] data_in,
    input logic [BITS-1:0] data_out   
    );
   
   default clocking cb  @(posedge clk);
      input 		    data_out;
      output 		    #0ns data_in, mode_in;
   endclocking

   initial
     begin
	//  Set initial values

	data_in = '0;
	mode_in = '0;

	// Wait for reset to end

	wait (rst_n);

	##1;
	$info("T1: LOAD");
	cb.data_in <= '1;
	cb.mode_in <= 2'b11;
	##1;
	$info("T2: DOWN-UP");
	cb.data_in <= '1;
	cb.mode_in <= 2'b10;
	##((2**BITS)-1);
	
	cb.mode_in <= 2'b01;	
	##(2*(2**BITS)-1);

	$info("T3: NOP");	
	cb.mode_in <= 2'b00;	
	##4;

	$info("T4: LOAD RANDOM");		
	cb.mode_in <= 2'b11;		
	cb.data_in <= $urandom;	
	##1;
	$info("T5: UP");			
	cb.mode_in <= 2'b01;	
	##(3*(2**BITS));
	
	$finish;
	
     end
endprogram
   
