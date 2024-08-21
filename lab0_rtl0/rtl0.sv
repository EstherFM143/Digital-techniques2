module rtl0
  (input logic clk,
   input logic 	      rst_n,
   input logic [7:0]  data_in,
   input logic 	      enable_in,
   output logic [7:0] data_out);

   logic [7:0] 	      r1, r2, r3, sum;
   
   register R1   (.clk(clk), .rst_n(rst_n), .data_in(data_in), .enable_in(enable_in), .data_out(r1));
   register R2   (.clk(clk), .rst_n(rst_n), .data_in(r1),      .enable_in(enable_in), .data_out(r2));
   register R3   (.clk(clk), .rst_n(rst_n), .data_in(r2),      .enable_in(enable_in), .data_out(r3));
   add3     ADD3 (.a_in(r1), .b_in(r2), .c_in(r3), .sum_out(sum));
   register R4   (.clk(clk), .rst_n(rst_n), .data_in(sum),     .enable_in(enable_in), .data_out(data_out));   

endmodule 

module register
   (input logic clk,
    input logic rst_n,
    input logic enable_in,
    input logic [7:0] data_in,
    output logic[7:0] data_out);

   always_ff @(posedge clk or negedge rst_n)
     if (rst_n == '0)
       data_out <= 8'b00000000;
     else
       if (enable_in == '1)
	 data_out <= data_in;
   
endmodule

module add3
  (input logic [7:0] a_in, b_in, c_in,
   output logic [7:0] sum_out);
   
   always_comb
     sum_out = a_in + b_in + c_in;
   
endmodule

