package fsmd_pkg;

   localparam int unsigned mynumber[7] = { 2, 3, 0, 9, 6, 4, 5 };  //student number,2309645

   // ALU function codes  
   typedef enum logic [3:0] {   
				MOVA = 4'b0000,
				INC  = 4'b0001,
				ADD  = 4'b0010,
                                MUL  = 4'b0011, // non-Mano!
                                SRA  = 4'b0100, // non-Mano!
				SUB  = 4'b0101,
				DEC  = 4'b0110,
				SLA  = 4'b0111, // non-Mano!
				AND  = 4'b1000,
				OR   = 4'b1001,
				XOR  = 4'b1010,
				NOT  = 4'b1011,
				MOVB = 4'b1100,
				SHR  = 4'b1101,
				SHL  = 4'b1110, // non-Mano!
				CLR  = 4'b1111
                                } alufunc_t;

   // dmux addresses
   typedef enum logic { ALU = '0, EXT = '1 } dsel_t;

   // Register bank, amux and bmux addresses
   typedef enum logic [2:0] { R0 = 3'b000, R1 = 3'b001, R2 = 3'b010, R3 = 3'b011, R4 = 3'b100, R5 = 3'b101, R6 = 3'b110, R7 = 3'b111 } rsel_t;
   
endpackage
   
