
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(fifo) -into $coutputgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_write -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_full_n -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/res_din -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(fifo) -into $cinputgroup]
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_read -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_empty_n -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/b_dout -into $return_group -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_read -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_empty_n -into $return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/AESL_inst_matrixmul/a_dout -into $return_group -radix hex
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
add_wave /apatb_matrixmul_top/LENGTH_a -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_b -into $tb_portdepth_group -radix hex
add_wave /apatb_matrixmul_top/LENGTH_res -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(fifo) -into $tbcoutputgroup]
add_wave /apatb_matrixmul_top/res_write -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_full_n -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/res_din -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(fifo) -into $tbcinputgroup]
add_wave /apatb_matrixmul_top/b_read -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_empty_n -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/b_dout -into $tb_return_group -radix hex
add_wave /apatb_matrixmul_top/a_read -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_empty_n -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_matrixmul_top/a_dout -into $tb_return_group -radix hex
save_wave_config matrixmul.wcfg
run all
quit

