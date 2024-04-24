onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vio_cordic_rotator_opt

do {wave.do}

view wave
view structure
view signals

do {vio_cordic_rotator.udo}

run -all

quit -force
