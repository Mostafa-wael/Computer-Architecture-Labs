# compile all projects
project compileall

# this command open the simulation for the entity named "registerFileModule"
vsim -gui work.memcount -gdataBusSize=32 -gaddressBusSize=4

# Fill Memory
mem load -filltype dec -filldata 700 -fillradix hexadecimal -skip 0 /memcount/ramUnit/ram

# add the signals you want to test in the wave
add wave -position insertpoint sim:/memcount/*

# set the radix to Hexadecimal
radix signal sim:/memcount/W_RE Binary
radix signal sim:/memcount/clk Binary
radix signal sim:/memcount/rst Binary
radix signal sim:/memcount/addressFromCount Hexadecimal
radix signal sim:/memcount/dataBus Hexadecimal

# init
force -freeze sim:/memcount/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/memcount/rst 1 0
run
force -freeze sim:/memcount/rst 2#0 0
force -freeze sim:/memcount/W_RE 2#0 0
run

# start from location 10 with data 6F6 and count down to location 0 with data 700
run
run
run
run
run
run
run
run
run
run
