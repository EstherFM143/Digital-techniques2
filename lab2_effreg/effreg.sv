
module and2 (input logic in1, in2,
	     output logic out1);

   assign out1 = in1 & in2;

endmodule


module or2 (input logic in1, in2,
	    output logic out1);

   assign out1 = in1 | in2;

endmodule


module inv (input logic in1,
	    output logic out1);

   assign out1 = ~in1;

endmodule


module dff (input logic clk, rst_n, din,
	    output logic q);

   always_ff @ (posedge clk or negedge rst_n)
     if (!rst_n)
       q <= 1'b0;
     else
       q <= din;

endmodule



module eff (input logic clk, rst_n, din, enable,
	    output logic q);

   logic 		 n1, n2, n3, n4, n5, n6, n7;

   assign n1 = enable;
   assign n2 = din;
   assign q = n7;
   
   dff U1 (.clk(clk), .rst_n(rst_n), .din(n6), .q(n7));
   or2 U2 (.in1(n4), .in2(n5), .out1(n6));
   and2 U3 (.in1(n1), .in2(n2), .out1(n4));
   and2 U4 (.in1(n3), .in2(n7), .out1(n5));
   inv U5 (.in1(n1), .out1(n3));
   
endmodule


module effreg
  #(parameter NBITS = 8)
   (input logic clk, 
    input logic rst_n,
    input logic enable,
    input logic [NBITS-1:0] din,
    output logic [NBITS-1:0] dout
    );

   generate
      for (genvar I = 0; I < NBITS; ++I) begin : eff_generate
	 eff eff_inst (.clk(clk), .rst_n(rst_n), .din(din[I]), .enable(enable), .q(dout[I]));
      end
   endgenerate

endmodule


