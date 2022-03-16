# Run the file by typing "do testPartC" in the transcript

# compileall projects
project compileall

#this command open the simulation for the entity named "partC"
vsim -gui work.partC -gn=16
#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/partc/a \
sim:/partc/b \
sim:/partc/sel \
sim:/partc/cIn \
sim:/partc/cOut \
sim:/partc/f

# set the radix to Hexadecimal
radix signal sim:/partc/a Hexadecimal
radix signal sim:/partc/b Hexadecimal
radix signal sim:/partc/sel Binary
radix signal sim:/partc/cIn Hexadecimal
radix signal sim:/partc/cOut Hexadecimal
radix signal sim:/partc/f Hexadecimal


#testCase1 -> 7807, 1
force -freeze sim:/partc/a 16#F00F 0
force -freeze sim:/partc/sel 2#00 0
#run simulation 
run 

#testCase2 -> F807, 1
force -freeze sim:/partc/a 16#F00F 0
force -freeze sim:/partc/sel 2#01 0
#run simulation 
run 

#testCase3 -> 7805, 0
force -freeze sim:/partc/a 16#F00A 0
force -freeze sim:/partc/sel 2#01 0
#run simulation 
run 

#testCase4 -> 7807, 1
force -freeze sim:/partc/a 16#F00F 0
force -freeze sim:/partc/cIn 2#0 0
force -freeze sim:/partc/sel 2#10 0
#run simulation 
run 

#testCase5 -> F807, 1
force -freeze sim:/partc/a 16#F00F 0
force -freeze sim:/partc/cIn 2#1 0
force -freeze sim:/partc/sel 2#10 0
#run simulation 
run 

#testCase6 -> F807, 1
force -freeze sim:/partc/a 16#F00F 0
force -freeze sim:/partc/sel 2#11 0
#run simulation 
run 








