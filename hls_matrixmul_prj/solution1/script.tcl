############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_matrixmul_prj
set_top matrixmul
add_files ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.h
add_files ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.cpp
add_files -tb ../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./hls_matrixmul_prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
