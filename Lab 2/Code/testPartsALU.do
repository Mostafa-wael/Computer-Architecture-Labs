# Run the file by typing "do testALU" in the transcript

# compileall projects
project compileall

#this command open the simulation for the entity named "ALU"
vsim -gui work.ALU -gn=16
#add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/ALU/*

# set the radix to Hexadecimal
radix signal sim:/ALU/A Hexadecimal
radix signal sim:/ALU/B Hexadecimal
radix signal sim:/ALU/SEL Binary
radix signal sim:/ALU/C_IN Hexadecimal
radix signal sim:/ALU/C_OUT Hexadecimal
radix signal sim:/ALU/F Hexadecimal
radix signal sim:/ALU/fA Hexadecimal
radix signal sim:/ALU/fB Hexadecimal
radix signal sim:/ALU/fC Hexadecimal
radix signal sim:/ALU/fD Hexadecimal


#=========== test cases for partA ===========#

#testCase1(F = A) -> oF0F, 0
force -freeze sim:/ALU/A 16#0F0F 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#0000 0
#run simulation 
run 

#testCase6(F = A + 1) -> 0FOF, 0
force -freeze sim:/ALU/A 16#0F0E 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#0000 0
#run simulation 
run 

################################

#testCase2(F = A + B) -> 0F10, 0
force -freeze sim:/ALU/A 16#0F0F 0
force -freeze sim:/ALU/B 16#0001 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#0001 0
#run simulation 
run 

#testCase3(F = A + B) -> 0000, 1
force -freeze sim:/ALU/A 16#FFFF 0
force -freeze sim:/ALU/B 16#0001 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#0001 0
#run simulation 
run 

#testCase7(A + B + 1) -> 0001, 1
force -freeze sim:/ALU/A 16#FFFF 0
force -freeze sim:/ALU/B 16#0001 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#0001 0
#run simulation 
run 

################################

#testCase4(F = A - B - 1 = A + ~B ) -> FFFD, 1
force -freeze sim:/ALU/A 16#FFFF 0
force -freeze sim:/ALU/B 16#0001 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#0010 0
#run simulation 
run 

#testCase8(A - B = A + ~B +1) -> 0F0E, 1
force -freeze sim:/ALU/A 16#0F0F 0
force -freeze sim:/ALU/B 16#0001 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#0010 0
#run simulation 
run 

################################

#testCase5(F = A - 1) -> FFFE, 1
force -freeze sim:/ALU/A 16#FFFF 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#0011 0
#run simulation 
run 

#testCase9(F = 0) -> 0000, 0
force -freeze sim:/partA/A UUUUUUUUUUUUUUUU 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#0011 0
#run simulation 
run 

#=========== test cases for partB ===========#

# testCase1(F = A and B) -> 000A, U
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/B 16#000A 0
force -freeze sim:/ALU/SEL 2#0100 0
#run simulation 
run 

#testCase2(F = A or B) -> F00F, U
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/B 16#000A 0
force -freeze sim:/ALU/SEL 2#0101 0
#run simulation 
run 

#testCase3(F = A xor B) -> F005, U
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/B 16#000A 0
force -freeze sim:/ALU/SEL 2#0110 0
#run simulation 
run 

#testCase4(F = Not A) -> 0FF0, U
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/B 16#000A 0
force -freeze sim:/ALU/SEL 2#0111 0
#run simulation 
run 

#=========== test cases for partC ===========#

#testCase1(F=Logic shift right A) -> 7807, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1000 0
#run simulation 
run 

#testCase2(F=Rotate right A) -> F807, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1001 0
#run simulation 
run 

#testCase3(F=Rotate right A) -> 7805, 0
force -freeze sim:/ALU/A 16#F00A 0
force -freeze sim:/ALU/SEL 2#1001 0
#run simulation 
run 

#testCase4(F=Rotate right A with Carry) -> 7807, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#1010 0
#run simulation 
run 

#testCase5(F=Rotate right A with Carry) -> F807, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#1010 0
#run simulation 
run 

#testCase6(F=Arithmetic shift right A) -> F807, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1011 0
#run simulation 
run 

#=========== test cases for partD ===========#

#testCase1(F=Logic shift left A) -> E01E, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1100 0
#run simulation 
run 

#testCase2(F=Rotate left A) -> E01F, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1101 0
#run simulation 
run 

#testCase3(F=Rotate left A with Carry) -> E01E, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/C_IN 2#0 0
force -freeze sim:/ALU/SEL 2#1110 0
#run simulation 
run 

#testCase4(F=Rotate left A with Carry) -> E01F, 1
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/C_IN 2#1 0
force -freeze sim:/ALU/SEL 2#1110 0
#run simulation 
run 

#testCase5(F = 0000) -> 0000, 0
force -freeze sim:/ALU/A 16#F00F 0
force -freeze sim:/ALU/SEL 2#1111 0
#run simulation 
run 
