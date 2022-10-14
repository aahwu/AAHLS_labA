
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $coutputgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_d1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_we1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_d0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_address0 -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinputgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_2_address0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_1_address0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_0_address0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_2_address0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_1_address0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_q1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_address1 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_q0 -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_0_address0 -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_start -into $blocksiggroup
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_done -into $blocksiggroup
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_idle -into $blocksiggroup
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_matrixmul_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_matrixmul_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_matrixmul_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_a_0 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_a_1 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_a_2 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_b_0 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_b_1 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_b_2 -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_res -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcoutputgroup]
add_wave /apatb_matrixmul_top/res_d1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/res_we1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/res_d0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/res_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_address0 -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinputgroup]
add_wave /apatb_matrixmul_top/b_2_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_2_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_2_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_2_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_2_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_2_address0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_1_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_1_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_1_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_1_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_1_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_1_address0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_0_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_0_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_0_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_0_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/b_0_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_0_address0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_2_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_2_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_2_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_2_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_2_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_2_address0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_1_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_1_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_1_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_1_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_1_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_1_address0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_0_q1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_0_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_0_address1 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_0_q0 -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_0_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_0_address0 -into $tb_return_group -radix hex
save_wave_config matrixmul.wcfg
run all
quit
