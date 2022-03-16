# compile all projects
project compileall
#
# this command open the simulation for the entity named "memandreg"
vsim -gui work.memandreg -gdataBusSize=32 -gmemAddressBusSize=4 -gregFileAddressBusSize=2
#
# add the signals you want to test in the wave
add wave -position insertpoint sim:/memandreg/*
#
# set the radix to Hexadecimal
radix signal sim:/memandreg/clk Binary
radix signal sim:/memandreg/rst Binary
radix signal sim:/memandreg/mem_W_RE Binary
radix signal sim:/memandreg/reg_R_E Binary
radix signal sim:/memandreg/reg_W_E Binary
radix signal sim:/memandreg/sourceAddress Unsigned
radix signal sim:/memandreg/destinationAddress Unsigned
radix signal sim:/memandreg/addressFromCount Hexadecimal
radix signal sim:/memandreg/dataBus Hexadecimal
#
# Fill Memory
mem load -filltype dec -filldata 16#2BC -fillradix hexadecimal -skip 0 /memandreg/ramUnit/ram
#
# init
force -freeze sim:/memandreg/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/memandreg/rst 1 0
run
force -freeze sim:/memandreg/rst 2#0 0
#

# instruction 1, read from memory[count] and write to reg[0]
force -freeze sim:/memandreg/mem_W_RE 2#0 0
force -freeze sim:/memandreg/reg_W_E 2#1 0
force -freeze sim:/memandreg/reg_R_E 2#0 0
force -freeze sim:/memandreg/destinationAddress 10#0 0
run

# instruction 2, read from memory[count] and write to reg[1]
force -freeze sim:/memandreg/mem_W_RE 2#0 0
force -freeze sim:/memandreg/reg_W_E 2#1 0
force -freeze sim:/memandreg/reg_R_E 2#0 0
force -freeze sim:/memandreg/destinationAddress 10#1 0
run

# instruction 3, copy reg[0] to reg[3]
force -freeze sim:/memandreg/mem_W_RE 2#1 0
    # read data from reg[0]
    force -freeze sim:/memandreg/sourceAddress 10#0 0
    force -freeze sim:/memandreg/reg_R_E 2#1 0
    # write data to reg[3]
    force -freeze sim:/memandreg/reg_W_E 2#1 0
    force -freeze sim:/memandreg/destinationAddress 10#3 0
run

# instruction 4, read from reg[1] and write to memory[count]
force -freeze sim:/memandreg/mem_W_RE 2#1 0
force -freeze sim:/memandreg/reg_R_E 2#1 0
force -freeze sim:/memandreg/reg_W_E 2#0 0
force -freeze sim:/memandreg/sourceAddress 10#1 0
run