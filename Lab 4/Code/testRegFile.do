# compile all projects
project compileall

# this command open the simulation for the entity named "registerFileModule"
vsim -gui work.registerFileModule -gdataBusSize=32 -gaddressBusSize=2

# add the signals you want to test in the wave
add wave -position insertpoint  \
sim:/registerFileModule/W_E \
sim:/registerFileModule/R_E \
sim:/registerFileModule/dataBus \
sim:/registerFileModule/destinationAddress \
sim:/registerFileModule/sourceAddress \
sim:/registerFileModule/Clk \
sim:/registerFileModule/rst 

# set the radix to Hexadecimal
radix signal sim:/registerFileModule/W_E Binary
radix signal sim:/registerFileModule/R_E Binary
radix signal sim:/registerFileModule/clk Binary
radix signal sim:/registerFileModule/rst Binary
radix signal sim:/registerFileModule/destinationAddress Unsigned
radix signal sim:/registerFileModule/sourceAddress Unsigned
radix signal sim:/registerFileModule/dataBus Hexadecimal

# init
force -freeze sim:/registerFileModule/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/registerFileModule/rst 2#1 0
force -freeze sim:/registerFileModule/W_E 2#1 0
force -freeze sim:/registerFileModule/R_E 2#0 0
run
force -freeze sim:/registerFileModule/rst 2#0 0
#
################################
# load data into registers
###############
echo ""
echo "##load data into registers##"
echo ""
force -freeze sim:/registerFileModule/W_E 2#1 0
force -freeze sim:/registerFileModule/R_E 2#0 0
###############

# write data to reg0
force -freeze sim:/registerFileModule/dataBus 16#00AA 0
force -freeze sim:/registerFileModule/destinationAddress 10#0 0
run

# write data to reg1
force -freeze sim:/registerFileModule/dataBus 16#00BB 0
force -freeze sim:/registerFileModule/destinationAddress 10#1 0
run

# write data to reg2
force -freeze sim:/registerFileModule/dataBus 16#00CC 0
force -freeze sim:/registerFileModule/destinationAddress 10#2 0
run

# write data to reg3
force -freeze sim:/registerFileModule/dataBus 16#00DD 0
force -freeze sim:/registerFileModule/destinationAddress 10#3 0
run

################################
# read data from registers
###############
echo ""
echo "##read data from registers##"
echo ""
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/W_E 2#0 0
force -freeze sim:/registerFileModule/R_E 2#1 0
###############

# read data from reg0
force -freeze sim:/registerFileModule/sourceAddress 10#0 0
run
echo "read data from reg0"
examine -hex sim:/registerFileModule/dataBus

# read data from reg1
force -freeze sim:/registerFileModule/sourceAddress 10#1 0
run
echo "read data from reg1"
examine -hex sim:/registerFileModule/dataBus

# read data from reg2
force -freeze sim:/registerFileModule/sourceAddress 10#2 0
run
echo "read data from reg2"
examine -hex sim:/registerFileModule/dataBus

# read data from reg3
force -freeze sim:/registerFileModule/sourceAddress 10#3 0
run
echo "read data from reg3"
examine -hex sim:/registerFileModule/dataBus

################################
# copy data from/into registers
###############
echo ""
echo "##copy data from/into registers##"
echo ""
noforce sim:/registerfilemodule/dataBus
###############
############### copy reg0 to reg1
# read data from reg0
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#0 0
echo "read data from reg0"
# write data to reg1
force -freeze sim:/registerFileModule/W_E 2#1 0
force -freeze sim:/registerFileModule/destinationAddress 10#1 0
echo "write data to reg1"
run
examine -hex sim:/registerFileModule/dataBus


# read data from reg1
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/W_E 2#0 0
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#1 0
run
echo "read data from reg1"
examine -hex sim:/registerFileModule/dataBus

echo ""
############### copy reg2 to reg0
# read data from reg2
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#2 0
echo "read data from reg2"
# write data to reg0
force -freeze sim:/registerFileModule/W_E 2#1 0
force -freeze sim:/registerFileModule/destinationAddress 10#0 0
echo "write data to reg0"
run
examine -hex sim:/registerFileModule/dataBus

# read data from reg0
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/W_E 2#0 0
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#0 0
run
echo "read data from reg0"
examine -hex sim:/registerFileModule/dataBus

echo ""
############### copy reg3 to reg0
# read data from reg3
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#3 0
echo "read data from reg3"
# write data to reg0
force -freeze sim:/registerFileModule/W_E 2#1 0
force -freeze sim:/registerFileModule/destinationAddress 10#0 0
echo "write data to reg0"
run
examine -hex sim:/registerFileModule/dataBus

# read data from reg0
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/W_E 2#0 0
force -freeze sim:/registerFileModule/R_E 2#1 0
force -freeze sim:/registerFileModule/sourceAddress 10#0 0
run
echo "read data from reg0"
examine -hex sim:/registerFileModule/dataBus

################################
# read data from registers
###############
echo ""
echo "##read data from registers##"
echo ""
noforce sim:/registerfilemodule/dataBus
force -freeze sim:/registerFileModule/W_E 2#0 0
force -freeze sim:/registerFileModule/R_E 2#1 0
###############

# read data from reg0
force -freeze sim:/registerFileModule/sourceAddress 10#0 0
run
echo "read data from reg0"
examine -hex sim:/registerFileModule/dataBus

# read data from reg1
force -freeze sim:/registerFileModule/sourceAddress 10#1 0
run
echo "read data from reg1"
examine -hex sim:/registerFileModule/dataBus

# read data from reg2
force -freeze sim:/registerFileModule/sourceAddress 10#2 0
run
echo "read data from reg2"
examine -hex sim:/registerFileModule/dataBus

# read data from reg3
force -freeze sim:/registerFileModule/sourceAddress 10#3 0
run
echo "read data from reg3"
examine -hex sim:/registerFileModule/dataBus

run

##Expected Output##
# 
# read data from reg0
# 000000DD
# read data from reg1
# 000000AA
# read data from reg2
# 000000CC
# read data from reg3
# 000000DD
