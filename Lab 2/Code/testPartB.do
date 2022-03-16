# Run the file by typing "do testPartB" in the transcript

# compileall projects
project compileall

#this command open the simulation for the entity named "partb"
vsim -gui work.partb -gn=16
#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/partb/a \
sim:/partb/b \
sim:/partb/sel \
sim:/partb/f

# set the radix to Hexadecimal
radix signal sim:/partb/a Hexadecimal
radix signal sim:/partb/b Binary
radix signal sim:/partb/sel Hexadecimal
radix signal sim:/partb/f Hexadecimal


#testCase1 -> 000A
force -freeze sim:/partb/a 16#F00F 0
force -freeze sim:/partb/b 16#000A 0
force -freeze sim:/partb/sel 2#00 0
#run simulation 
run 

#testCase2 -> F00F
force -freeze sim:/partb/a 16#F00F 0
force -freeze sim:/partb/b 16#000A 0
force -freeze sim:/partb/sel 2#01 0
#run simulation 
run 

#testCase3 -> F005
force -freeze sim:/partb/a 16#F00F 0
force -freeze sim:/partb/b 16#000A 0
force -freeze sim:/partb/sel 2#10 0
#run simulation 
run 

#testCase4 -> 0FF0
force -freeze sim:/partb/a 16#F00F 0
force -freeze sim:/partb/b 16#000A 0
force -freeze sim:/partb/sel 2#11 0
#run simulation 
run 






