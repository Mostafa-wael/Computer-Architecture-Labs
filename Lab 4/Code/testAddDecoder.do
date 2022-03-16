
# compileall projects
project compileall

#this command open the simulation for the entity named "addressdecoder"
vsim -gui work.addressdecoder -gn=32 -gm=4

#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/addressdecoder/inputAdd \
sim:/addressdecoder/decodedAdd \
sim:/addressdecoder/en \
sim:/addressdecoder/Clk \
sim:/addressdecoder/rst


# set the radix to Hexadecimal
radix signal sim:/addressdecoder/clk Binary
radix signal sim:/addressdecoder/rst Binary
radix signal sim:/addressdecoder/en Binary
radix signal sim:/addressdecoder/inputAdd Hexadecimal
radix signal sim:/addressdecoder/decodedAdd Binary



#init
force -freeze sim:/addressdecoder/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/addressdecoder/rst 2#1 0
run
force -freeze sim:/addressdecoder/rst 2#0 0
run
################################
force -freeze sim:/addressdecoder/en 2#1 0
force -freeze sim:/addressdecoder/inputAdd 2#11 0
run

force -freeze sim:/addressdecoder/en 2#1 0
force -freeze sim:/addressdecoder/inputAdd 2#10 0
run

force -freeze sim:/addressdecoder/en 2#1 0
force -freeze sim:/addressdecoder/inputAdd 2#00 0
run

force -freeze sim:/addressdecoder/en 2#1 0
force -freeze sim:/addressdecoder/inputAdd 2#01 0
run

force -freeze sim:/addressdecoder/en 2#0 0
force -freeze sim:/addressdecoder/inputAdd 2#11 0
run

force -freeze sim:/addressdecoder/en 2#0 0
force -freeze sim:/addressdecoder/inputAdd 2#10 0
run

run
