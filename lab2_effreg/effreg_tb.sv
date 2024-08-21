/////////////////////////////////////////////////////

`ifndef SYNTHESIS
  
module effreg_tb;
   logic clk, rst_n, enable;
   logic [3:0] data_in;
   logic [3:0] data_out;
   
   initial
     begin
	clk = '0;
	rst_n = '0;
	enable = '1;
	data_in = 16'b1010101010101010;

	#50ns; 
	clk = '1;

	#50ns; 
	clk = '0;
	rst_n = '1;

	#50ns;
	clk = '1;
	
	#50ns;
	clk = '0;
	rst_n = '0;
     end

   effreg #(.NBITS(4)) DUT
     (.clk(clk),
      .rst_n(rst_n),
      .din(data_in),
      .enable(enable),
      .dout(data_out));

endmodule

   
`endif
