	;; R0: Number counter
	LDI R0 3
	;; R1: Jump address
	LDI R1 4
	;; R3: I/O port address
	CLR R3
	;; R7: Largest number
	IOR R7 R3
	;; R6: Candidate number 
	IOR R6 R3
	;; Subtract largest from candidate
	SUB R5 R6 R7
	;; Don't save candidate if negative
	BRN R5 2
	;; Save candidate
	MOVA R7 R6
	;; Decrement number counter
	DEC R0 R0
	;; If counter != 0, jump back 
	BRZ R0 2
	;; Jump back to read next number
	JMP R1
	;; Increment largest number R7 by 7
	ADI R7 R7 7
	;; Create memory address 128
	LDI R0 4
	SHL R0 R0
	SHL R0 R0
	SHL R0 R0
	SHL R0 R0
	SHL R0 R0
	;; Store R7 to M[128]
	ST R0 R7
	;; Read back to R6 from M[128]
	LD R6 R0
	;; Compute R6 = R6*R6 + 1
	MUL R6 R6 R6
	INC R6 R6
	;; Set LSB to zero
	LDI R5 1
	NOT R5 R5
	AND R5 R5 R6
	;; Divide by two
	SHR R5 R5
	;; Write out result
	CLR R0
	IOW R0 R5
	;; XXL
	LDI R6 7
	XXL
	HAL
	;; End
