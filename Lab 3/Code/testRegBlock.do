
# compileall projects
project compileall

#this command open the simulation for the entity named "registersblock"
vsim -gui work.registersblock -gunitSize=32 -gunitsNum=4

#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/registersblock/ENR \
sim:/registersblock/ENW \
sim:/registersblock/D \
sim:/registersblock/Q \
sim:/registersblock/Clk \
sim:/registersblock/rst \
sim:/registersblock/tempQ


# set the radix to Hexadecimal
radix signal sim:/registersblock/clk Binary
radix signal sim:/registersblock/rst Binary
radix signal sim:/registersblock/ENW Unsigned
radix signal sim:/registersblock/ENR Unsigned
radix signal sim:/registersblock/D Hexadecimal
radix signal sim:/registersblock/Q Hexadecimal
radix signal sim:/registersblock/tempQ Hexadecimal



#init
force -freeze sim:/registersblock/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/registersblock/rst 2#1 0
run
force -freeze sim:/registersblock/rst 2#0 0
run
################################
force -freeze sim:/registersblock/ENW 10#8 0
force -freeze sim:/registersblock/ENR 10#8 0
force -freeze sim:/registersblock/D 16#FFFFEEEE 0
run
run

force -freeze sim:/registersblock/ENW 10#4 0
force -freeze sim:/registersblock/ENR 10#4 0
force -freeze sim:/registersblock/D 16#AAAAEEEE 0
run
run

force -freeze sim:/registersblock/ENW 10#2 0
force -freeze sim:/registersblock/ENR 10#8 0
force -freeze sim:/registersblock/D 16#AAAABBBB 0
run
run

force -freeze sim:/registersblock/ENW 10#4 0
force -freeze sim:/registersblock/ENR 10#2 0
force -freeze sim:/registersblock/D 16#AAAACCCC 0
run
run
