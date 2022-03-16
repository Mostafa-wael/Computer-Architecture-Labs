# Run the file by typing "do testpartA" in the transcript

# compileall projects
project compileall

#this command open the simulation for the entity named "partA"
vsim -gui work.partA -gn=16

#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/partA/*


# set the radix to Hexadecimal
radix signal sim:/partA/a Hexadecimal
radix signal sim:/partA/b Hexadecimal
radix signal sim:/partA/cIn Hexadecimal
radix signal sim:/partA/cOut Hexadecimal
radix signal sim:/partA/sel Binary
radix signal sim:/partA/f Hexadecimal
radix signal sim:/partA/inputB Hexadecimal


################################

#testCase1(F = A) -> oF0F, 0
force -freeze sim:/partA/a 16#0F0F 0
force -freeze sim:/partA/cIn 2#0 0
force -freeze sim:/partA/sel 2#00 0
#run simulation 
run 

#testCase6(F = A + 1) -> 0FOF, 0
force -freeze sim:/partA/a 16#0F0E 0
force -freeze sim:/partA/cIn 2#1 0
force -freeze sim:/partA/sel 2#00 0
#run simulation 
run 

################################

#testCase2(F = A + B) -> 0F10, 0
force -freeze sim:/partA/a 16#0F0F 0
force -freeze sim:/partA/b 16#0001 0
force -freeze sim:/partA/cIn 2#0 0
force -freeze sim:/partA/sel 2#01 0
#run simulation 
run 

#testCase3(F = A + B) -> 0000, 1
force -freeze sim:/partA/a 16#FFFF 0
force -freeze sim:/partA/b 16#0001 0
force -freeze sim:/partA/cIn 2#0 0
force -freeze sim:/partA/sel 2#01 0
#run simulation 
run 

#testCase7(A + B + 1) -> 0001, 1
force -freeze sim:/partA/a 16#FFFF 0
force -freeze sim:/partA/b 16#0001 0
force -freeze sim:/partA/cIn 2#1 0
force -freeze sim:/partA/sel 2#01 0
#run simulation 
run 

################################

#testCase4(F = A - B - 1 = A + ~B ) -> FFFD, 1
force -freeze sim:/partA/a 16#FFFF 0
force -freeze sim:/partA/b 16#0001 0
force -freeze sim:/partA/cIn 2#0 0
force -freeze sim:/partA/sel 2#10 0
#run simulation 
run 

#testCase8(A - B = A + ~B +1) -> 0F0E, 1
force -freeze sim:/partA/a 16#0F0F 0
force -freeze sim:/partA/b 16#0001 0
force -freeze sim:/partA/cIn 2#1 0
force -freeze sim:/partA/sel 2#10 0
#run simulation 
run 

################################

#testCase5(F = A - 1) -> FFFE, 1
force -freeze sim:/partA/a 16#FFFF 0
force -freeze sim:/partA/cIn 2#0 0
force -freeze sim:/partA/sel 2#11 0
#run simulation 
run 

#testCase9(F = 0) -> 0000, 0
#force -freeze sim:/partA/a UUUUUUUUUUUUUUUU 0
force -freeze sim:/partA/cIn 2#1 0
force -freeze sim:/partA/sel 2#11 0
#run simulation 
run 





