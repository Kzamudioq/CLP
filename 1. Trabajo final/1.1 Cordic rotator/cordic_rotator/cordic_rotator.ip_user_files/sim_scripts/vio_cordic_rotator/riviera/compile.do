vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" \
"../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/sim/vio_cordic_rotator.v" \


vlog -work xil_defaultlib \
"glbl.v"

