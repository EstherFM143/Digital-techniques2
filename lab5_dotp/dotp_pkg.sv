package dotp_pkg;

   localparam NTAPS = 5;                 // Number of data/coeff inputs
   localparam DB = 16;                    // Data bits (d_in) (Optimizes performance)
   localparam CB = 16;                    // Coefficient bits /c_in)

   localparam MB = 2 * DB;               // Multiplier output bits
   localparam SB = MB + 1;               // Accumulated sum bits
   localparam QB = DB;                    // Quantized (rounded) bits

   localparam logic signed [QB-1:0] rmax = $signed({QB{1'b1}} >> 1); // Max output value
   localparam logic signed [QB-2:0] tmp = {QB-1 {1'b0}};
   localparam logic signed [QB-1:0] rmin = $signed({1'b1, tmp}); // Min output value

   /*
    Repetition operator example:
    { 3 { 1'b1 } } is equal to 3'b111

    Comcatenation operator example:
    { 1'b1, 7'b0000000 } is equal to 8'b10000000
        
    Remember that concatenation { } result is unsigned.
    Use $signed( ) to force signedness.
    */
   
endpackage
   
