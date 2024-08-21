add wave -noupdate -expand -group Datatypes -radix binary /datatypes_tb/one_bit
add wave -noupdate -expand -group Datatypes -radix binary /datatypes_tb/one_byte

add wave -noupdate -expand -group Datatypes -radix binary /datatypes_tb/four_bytes
add wave -noupdate -expand -group Datatypes -radix binary /datatypes_tb/word32

add wave -noupdate -expand -group Datatypes /datatypes_tb/colors

add wave -noupdate -expand -group Operations -radix binary /datatypes_tb/a
add wave -noupdate -expand -group Operations -radix binary /datatypes_tb/b

add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/add_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/sub_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/mul_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/div_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/mod_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/lsl_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/lsr_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/asl_ab
add wave -noupdate -expand -group Operations -expand -group { Arithm and shifts } -radix binary /datatypes_tb/asr_ab

add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/eq_ab
add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/neq_ab
add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/gt_ab
add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/lt_ab
add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/ge_ab
add wave -noupdate -expand -group Operations -expand -group { Relational } -radix binary /datatypes_tb/le_ab

add wave -noupdate -expand -group Operations -expand -group {Bitwise Logical} -radix binary /datatypes_tb/and_ab
add wave -noupdate -expand -group Operations -expand -group {Bitwise Logical} -radix binary /datatypes_tb/or_ab
add wave -noupdate -expand -group Operations -expand -group {Bitwise Logical} -radix binary /datatypes_tb/xor_ab
add wave -noupdate -expand -group Operations -expand -group {Bitwise Logical} -radix binary /datatypes_tb/not_a
add wave -noupdate -expand -group Operations -expand -group Logical -radix binary /datatypes_tb/land_ab
add wave -noupdate -expand -group Operations -expand -group Logical -radix binary /datatypes_tb/lor_ab
add wave -noupdate -expand -group Operations -expand -group Logical -radix binary /datatypes_tb/lnot_a
add wave -noupdate -expand -group Operations -expand -group {Reductive Logical} -radix binary /datatypes_tb/rand_a
add wave -noupdate -expand -group Operations -expand -group {Reductive Logical} -radix binary /datatypes_tb/ror_a
add wave -noupdate -expand -group Operations -expand -group {Reductive Logical} -radix binary /datatypes_tb/rxor_a

configure wave -signalnamewidth 1
run -all
wave zoom full


