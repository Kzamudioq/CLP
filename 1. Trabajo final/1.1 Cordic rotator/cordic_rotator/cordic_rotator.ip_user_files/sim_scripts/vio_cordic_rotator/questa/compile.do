vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl/verilog" "+incdir+../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/hdl" \
"../../../../cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/sim/vio_cordic_rotator.v" \


vlog -work xil_defaultlib \
"glbl.v"

