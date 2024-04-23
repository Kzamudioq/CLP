# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/ktzam/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-18028-LAPTOP-G5K3UH8C/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/ktzam/Downloads/sincos/sincos.cache/wt [current_project]
set_property parent.project_path C:/Users/ktzam/Downloads/sincos/sincos.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:arty-z7-10:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/ktzam/Downloads/sincos/sincos.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/ktzam/Downloads/sincos/MyHDL/sincos.v
read_ip -quiet c:/Users/ktzam/Downloads/sincos/sincos.srcs/sources_1/ip/cordic_0/cordic_0.xci
set_property used_in_implementation false [get_files -all c:/Users/ktzam/Downloads/sincos/sincos.srcs/sources_1/ip/cordic_0/cordic_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/ktzam/Downloads/sincos/sincos.srcs/constrs_1/new/sincos.xdc
set_property used_in_implementation false [get_files C:/Users/ktzam/Downloads/sincos/sincos.srcs/constrs_1/new/sincos.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top sincos -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sincos.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file sincos_utilization_synth.rpt -pb sincos_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]