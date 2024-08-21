# Digital-techniques2
The objective of this project is to architect and design a simple microprocessor CPU core, which
draws significant parallels with the MyCPU. The MyCPU is a processor core that operates on a
16-bit instruction set and is deeply rooted in the principles of processor architecture. The core
architecture of the processor is realized through a synthesized register-level model using SystemVerilog. 
The language used is SystemVerilog (a hardware description language), which is employed for implementing the RTL architecture
and for debugging.

The project involved several design and verification tasks. The design phase included the
creation of various module instances such as “mux_2x16”, “mux_3x16”, “fu”, “ir”, “pc”, “rb”, and
“cu”. Each of these modules was associated with four SystemVerilog code files.
These files contained the RTL module code (dut.sv), a test program that generates test data in
simulation (dut_test.sv), verification or checking code (dut_svamod.sv), and a testbench that
integrates the models defined in the other files (dut_tb.sv).
The verification phase involved the instantiation of the RTL design (“design under test”) in a
testbench module that also generates the clock and reset signals. Additional checks were
performed using a module that contains SystemVerilog concurrent assertions.

The project utilized several methods and tools. The language used was SystemVerilog (a
hardware description language), which was employed for implementing the RTL architecture
and for debugging. All design tasks are executed on the university's (University of Oulu) Linux computing servers,
(Linux remote desktop program, particularly Lehmus VDI desktop/ server).
The RTL code was executed using a simulator, which is a crucial tool for an RTL logic designer.
The synthesizability of the code was checked using Mentor Graphics Questa Autocheck, which
presents a list of “issues” found in the code. Logic synthesis was performed using flip-flops and
logic gates available in a component library provided by a silicon vendor. After synthesis, the
4 functional equivalence between the original RTL and synthesized gate-level netlist was verified
using Formal Logic Equivalence Check (LEC). Lastly, Gate-Level Simulation was used to check
synthesis results and reveal any logical or timing problems.

The personal design requirements for this project were centered around two key parameters:
the clock frequency and the XXL command.
Clock Frequency: The clock frequency, denoted as CLK_PERIOD, was determined using a
specific formula: 10 + N ns, where N represents the last digit of the student number. In this
particular case, N is 5 (from the student number 2309645), resulting in a clock frequency of 15
ns.
XXL Command: The functionality of the XXL instruction was chosen based on the second to last
digit D of the student number. For this project, D is 4, which corresponds to the instruction R0 =
(R1+R2)/2. This instruction calculates the average of two signed numbers, R1 and R2. Dividing
by 2 is equivalent to a right shift operation in binary arithmetic.
These requirements were integral to the design and functionality of the microprocessor CPU
core.

Report files will be displayed upon request. Lab and project input files are available.
