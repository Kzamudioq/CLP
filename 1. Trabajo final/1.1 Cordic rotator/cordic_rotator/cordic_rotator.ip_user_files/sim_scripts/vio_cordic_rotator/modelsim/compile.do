vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" \
"../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/sim/vio_cordic_rotator.v" \


vlog -work xil_defaultlib \
"glbl.v"

