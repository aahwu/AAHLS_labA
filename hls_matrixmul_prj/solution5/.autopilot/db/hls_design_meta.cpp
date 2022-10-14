#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("a_0_dout", 8, hls_in, 0, "ap_fifo", "fifo_port_we", 3),
	Port_Property("a_0_empty_n", 1, hls_in, 0, "ap_fifo", "fifo_status", 3),
	Port_Property("a_0_read", 1, hls_out, 0, "ap_fifo", "fifo_data", 3),
	Port_Property("a_1_dout", 8, hls_in, 1, "ap_fifo", "fifo_port_we", 3),
	Port_Property("a_1_empty_n", 1, hls_in, 1, "ap_fifo", "fifo_status", 3),
	Port_Property("a_1_read", 1, hls_out, 1, "ap_fifo", "fifo_data", 3),
	Port_Property("a_2_dout", 8, hls_in, 2, "ap_fifo", "fifo_port_we", 3),
	Port_Property("a_2_empty_n", 1, hls_in, 2, "ap_fifo", "fifo_status", 3),
	Port_Property("a_2_read", 1, hls_out, 2, "ap_fifo", "fifo_data", 3),
	Port_Property("b_0_dout", 8, hls_in, 3, "ap_fifo", "fifo_port_we", 3),
	Port_Property("b_0_empty_n", 1, hls_in, 3, "ap_fifo", "fifo_status", 3),
	Port_Property("b_0_read", 1, hls_out, 3, "ap_fifo", "fifo_data", 3),
	Port_Property("b_1_dout", 8, hls_in, 4, "ap_fifo", "fifo_port_we", 3),
	Port_Property("b_1_empty_n", 1, hls_in, 4, "ap_fifo", "fifo_status", 3),
	Port_Property("b_1_read", 1, hls_out, 4, "ap_fifo", "fifo_data", 3),
	Port_Property("b_2_dout", 8, hls_in, 5, "ap_fifo", "fifo_port_we", 3),
	Port_Property("b_2_empty_n", 1, hls_in, 5, "ap_fifo", "fifo_status", 3),
	Port_Property("b_2_read", 1, hls_out, 5, "ap_fifo", "fifo_data", 3),
	Port_Property("res_din", 16, hls_out, 6, "ap_fifo", "fifo_port_we", 3),
	Port_Property("res_full_n", 1, hls_in, 6, "ap_fifo", "fifo_status", 3),
	Port_Property("res_write", 1, hls_out, 6, "ap_fifo", "fifo_data", 3),
};
const char* HLS_Design_Meta::dut_name = "matrixmul";