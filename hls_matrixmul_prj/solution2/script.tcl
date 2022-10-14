############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_matrixmul_prj
set_top matrixmul
add_files ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.cpp
add_files ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.h
add_files -tb ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution2" -flow_target vivado
set_part {xcvu9p-flgb2104-1-e}
create_clock -period 10 -name default
source "./hls_matrixmul_prj/solution2/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
