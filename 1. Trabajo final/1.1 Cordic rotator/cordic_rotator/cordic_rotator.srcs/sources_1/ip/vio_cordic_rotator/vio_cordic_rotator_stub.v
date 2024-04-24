// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Tue Apr 23 14:08:38 2024
// Host        : LAPTOP-G5K3UH8C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/ktzam/Downloads/CIRCUITOS
//               LOGICO/20042024/cordic_rotator/cordic_rotator.srcs/sources_1/ip/vio_cordic_rotator/vio_cordic_rotator_stub.v}
// Design      : vio_cordic_rotator
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.1" *)
module vio_cordic_rotator(clk, probe_in0, probe_in1, probe_out0, 
  probe_out1, probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[16:0],probe_in1[16:0],probe_out0[31:0],probe_out1[15:0],probe_out2[15:0]" */;
  input clk;
  input [16:0]probe_in0;
  input [16:0]probe_in1;
  output [31:0]probe_out0;
  output [15:0]probe_out1;
  output [15:0]probe_out2;
endmodule
