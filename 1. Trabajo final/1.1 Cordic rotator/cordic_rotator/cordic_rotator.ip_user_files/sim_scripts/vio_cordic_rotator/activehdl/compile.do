vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" \
"../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/sim/vio_cordic_rotator.v" \


vlog -work xil_defaultlib \
"glbl.v"

