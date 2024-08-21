import dotp_pkg::*;

program dotp_test
   (output var logic  [NTAPS-1:0][DB-1:0] d_in,
    output var logic  [NTAPS-1:0][CB-1:0] c_in,
    input logic [DB-1:0] 	       r_out
    );

   real 			       c[NTAPS];
   real 			       d[NTAPS];   
   real 			       signal_series[50*NTAPS];
   real 			       error_series[50*NTAPS];   
   real 			       r_ideal; 
   real 			       sqnr;
   real 			       sqnrdb;   
   real 			       flp_data;
   logic signed [DB-1:0] 	       fxp_data;
   logic signed [DB-1:0] 	       error;
   real 			       error_ideal;      
   real 			       t = 0.0;
   const real 			       M_PI = 3.1416;
   const real 			       B1 = 0.15;
   const real 			       B2 = 0.25;
   real 			       f = 0.25;
   const int 			       SIMULATION_LENGTH = 1000;

   //////////////////////////////////////////////////////////////////////
   // Reference model
   //////////////////////////////////////////////////////////////////////

   function real dotpref_real(input real c[NTAPS],
			      input real d[NTAPS]);
      real r;
      const real rmax = (2.0 ** real'(DB-1)) - 1.0;
      const real rmin = - (2.0 ** real'(DB-1));      
      
      r = 0;
      for (int i=0; i < NTAPS; ++i)
	begin
	   r = r + c[i] * d[i];
	end

      if (r > rmax)
	r = rmax;
      else if (r < rmin)
	r = rmin;

      return r;
   endfunction

   //////////////////////////////////////////////////////////////////////
   // Test sequence
   //////////////////////////////////////////////////////////////////////
   
   initial
     begin

	d_in = '0;
	c_in = '0;
	sqnr = 0.0;
	for (int i=0; i < NTAPS; ++i)
	  begin
	     d[i] = 0.0;
	     c[i] = 0.0;
	  end

	for (int i=0; i < 50*NTAPS; ++i)
	  begin
	     signal_series[i] = 0.0;
	     error_series[i] = 0.0;	     
	  end
	
	#10ns;

	////////////////////////////////////////////////////////////////////////////////////
	// Saturation test
	////////////////////////////////////////////////////////////////////////////////////	

	$info("Saturation test");

	// Set coefficients to max value
	for (int i=0; i < NTAPS; ++i)
	  begin
	     c[i] =  2.0/NTAPS;
	     c_in[i] = (2**(CB-1)-1);	     
	     c_in[i] *= c[i];
	  end

	flp_data  = -(2.0**(DB-1));	
	fxp_data = flp_data;
	
	repeat(100)
	  begin
	     for (int i=NTAPS-1; i > 0; --i)
	       d[i] = d[i-1];
	     d[0] = flp_data;

	     for (int i=0; i < NTAPS; ++i)
	       begin
		  fxp_data = d[i];
		  d_in[i] = $unsigned( fxp_data );
	       end


	     r_ideal = dotpref_real(c, d);
	     #1step;

	     error_ideal = $signed(r_out);
	     error_ideal -= r_ideal;	     
	     
	     #10ns;	     
	     
	     flp_data += 2*2**(DB-1)/100.0;	     
	     fxp_data = flp_data;
	  end

	////////////////////////////////////////////////////////////////////////////////////
	// Zero inputs
	////////////////////////////////////////////////////////////////////////////////////	
	
	#10ns;	     	
	d_in = '0;
	c_in = '0;
	r_ideal = 0.0;
	for (int i=0; i < NTAPS; ++i)
	  begin
	     d[i] = 0.0;
	     c[i] = 0.0;
	  end

	for (int i=0; i < 50*NTAPS; ++i)
	  begin
	     signal_series[i] = 0.0;
	     error_series[i] = 0.0;	     
	  end
	
	#50ns;
	
	////////////////////////////////////////////////////////////////////////////////////
	// Sine sweep test
	////////////////////////////////////////////////////////////////////////////////////	

	$info("Sine sweep test");	

	// Create coefficients
	for (int i=0; i < NTAPS; ++i)
	  begin
	     int x;
	     x = (i-NTAPS/2);
	     if (x == 0)
	       c[i] =  (0.5);
	     else
	       c[i] =  (B1*$sin(2*B1*M_PI*x)/(2*B1*M_PI*x));
	     if (c[i] >= 0)
	       c_in[i] = (2**(CB-1)-1);
	     else
	       c_in[i] = (2**(CB-1));	       
	     c_in[i] *= c[i];
	  end

	#10ns;
	
	repeat(SIMULATION_LENGTH)
	  begin

	     flp_data = ((2.0**(DB-1))-1.0) * $sin( 2 * M_PI * f * t);
	     fxp_data = flp_data;
	     
	     for (int i=NTAPS-1; i > 0; --i)
	       d[i] = d[i-1];
	     d[0] = flp_data;

	     for (int i=0; i < NTAPS; ++i)
	       begin
		  fxp_data = d[i];
		  d_in[i] = $unsigned( fxp_data );
	       end

	     r_ideal = dotpref_real(c, d);
	     
	     t = t + 1.0;
	     f = f - 0.125/SIMULATION_LENGTH;

	     #1step;

	     error_ideal = $signed(r_out);
	     error_ideal -= r_ideal;	     

	     for (int i=50*NTAPS-1; i > 0; --i) 
	       begin
		  signal_series[i] = signal_series[i-1];		
		  error_series[i] = error_series[i-1];
	       end
	     signal_series[0] = r_ideal;
	     error_series[0] = error_ideal;
	     
	     sqnr = 0.0;
	     for (int i=0; i < 50*NTAPS; ++i)
	       begin
		  if (error_series[i] != 0)
		    sqnr += (signal_series[i]*signal_series[i])/(error_series[i]*error_series[i]);
	       end
	     sqnr = sqnr/(50*NTAPS);
	     if (sqnr > 0)
	       sqnrdb = 10*$log10(sqnr);
	     else
	       sqnrdb = 0.0;

	     #10ns;	     

	  end
     end

endprogram
   
