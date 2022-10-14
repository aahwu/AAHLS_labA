// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="matrixmul_matrixmul,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-1-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.816000,HLS_SYN_LAT=37,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=116,HLS_SYN_LUT=252,HLS_VERSION=2022_1}" *)

module matrixmul (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_0_dout,
        a_0_empty_n,
        a_0_read,
        a_1_dout,
        a_1_empty_n,
        a_1_read,
        a_2_dout,
        a_2_empty_n,
        a_2_read,
        b_0_dout,
        b_0_empty_n,
        b_0_read,
        b_1_dout,
        b_1_empty_n,
        b_1_read,
        b_2_dout,
        b_2_empty_n,
        b_2_read,
        res_din,
        res_full_n,
        res_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] a_0_dout;
input   a_0_empty_n;
output   a_0_read;
input  [7:0] a_1_dout;
input   a_1_empty_n;
output   a_1_read;
input  [7:0] a_2_dout;
input   a_2_empty_n;
output   a_2_read;
input  [7:0] b_0_dout;
input   b_0_empty_n;
output   b_0_read;
input  [7:0] b_1_dout;
input   b_1_empty_n;
output   b_1_read;
input  [7:0] b_2_dout;
input   b_2_empty_n;
output   b_2_read;
output  [15:0] res_din;
input   res_full_n;
output   res_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg a_0_read;
reg a_1_read;
reg a_2_read;
reg b_0_read;
reg b_1_read;
reg b_2_read;
reg res_write;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    a_0_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln54_fu_97_p2;
reg    a_1_blk_n;
reg    a_2_blk_n;
reg   [7:0] a_0_read_reg_124;
reg   [7:0] a_1_read_reg_129;
reg   [7:0] a_2_read_reg_134;
wire    grp_matrixmul_Pipeline_Col_fu_74_ap_start;
wire    grp_matrixmul_Pipeline_Col_fu_74_ap_done;
wire    grp_matrixmul_Pipeline_Col_fu_74_ap_idle;
wire    grp_matrixmul_Pipeline_Col_fu_74_ap_ready;
wire    grp_matrixmul_Pipeline_Col_fu_74_b_0_read;
wire    grp_matrixmul_Pipeline_Col_fu_74_b_1_read;
wire    grp_matrixmul_Pipeline_Col_fu_74_b_2_read;
wire   [15:0] grp_matrixmul_Pipeline_Col_fu_74_res_din;
wire    grp_matrixmul_Pipeline_Col_fu_74_res_write;
reg    grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [1:0] i_fu_52;
wire   [1:0] add_ln54_fu_103_p2;
reg    ap_block_state2;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg = 1'b0;
end

matrixmul_matrixmul_Pipeline_Col grp_matrixmul_Pipeline_Col_fu_74(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrixmul_Pipeline_Col_fu_74_ap_start),
    .ap_done(grp_matrixmul_Pipeline_Col_fu_74_ap_done),
    .ap_idle(grp_matrixmul_Pipeline_Col_fu_74_ap_idle),
    .ap_ready(grp_matrixmul_Pipeline_Col_fu_74_ap_ready),
    .b_0_dout(b_0_dout),
    .b_0_empty_n(b_0_empty_n),
    .b_0_read(grp_matrixmul_Pipeline_Col_fu_74_b_0_read),
    .b_1_dout(b_1_dout),
    .b_1_empty_n(b_1_empty_n),
    .b_1_read(grp_matrixmul_Pipeline_Col_fu_74_b_1_read),
    .b_2_dout(b_2_dout),
    .b_2_empty_n(b_2_empty_n),
    .b_2_read(grp_matrixmul_Pipeline_Col_fu_74_b_2_read),
    .res_din(grp_matrixmul_Pipeline_Col_fu_74_res_din),
    .res_full_n(res_full_n),
    .res_write(grp_matrixmul_Pipeline_Col_fu_74_res_write),
    .sext_ln60(a_0_read_reg_124),
    .sext_ln60_1(a_1_read_reg_129),
    .sext_ln60_2(a_2_read_reg_134)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg <= 1'b1;
        end else if ((grp_matrixmul_Pipeline_Col_fu_74_ap_ready == 1'b1)) begin
            grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_52 <= 2'd0;
    end else if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_52 <= add_ln54_fu_103_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_0_read_reg_124 <= a_0_dout;
        a_1_read_reg_129 <= a_1_dout;
        a_2_read_reg_134 <= a_2_dout;
    end
end

always @ (*) begin
    if (((icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_0_blk_n = a_0_empty_n;
    end else begin
        a_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_0_read = 1'b1;
    end else begin
        a_0_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_1_blk_n = a_1_empty_n;
    end else begin
        a_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_1_read = 1'b1;
    end else begin
        a_1_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_2_blk_n = a_2_empty_n;
    end else begin
        a_2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        a_2_read = 1'b1;
    end else begin
        a_2_read = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_matrixmul_Pipeline_Col_fu_74_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        b_0_read = grp_matrixmul_Pipeline_Col_fu_74_b_0_read;
    end else begin
        b_0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        b_1_read = grp_matrixmul_Pipeline_Col_fu_74_b_1_read;
    end else begin
        b_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        b_2_read = grp_matrixmul_Pipeline_Col_fu_74_b_2_read;
    end else begin
        b_2_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        res_write = grp_matrixmul_Pipeline_Col_fu_74_res_write;
    end else begin
        res_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~(((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n))) & (icmp_ln54_fu_97_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_matrixmul_Pipeline_Col_fu_74_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln54_fu_103_p2 = (i_fu_52 + 2'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state2 = (((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_2_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_1_empty_n)) | ((icmp_ln54_fu_97_p2 == 1'd0) & (1'b0 == a_0_empty_n)));
end

assign grp_matrixmul_Pipeline_Col_fu_74_ap_start = grp_matrixmul_Pipeline_Col_fu_74_ap_start_reg;

assign icmp_ln54_fu_97_p2 = ((i_fu_52 == 2'd3) ? 1'b1 : 1'b0);

assign res_din = grp_matrixmul_Pipeline_Col_fu_74_res_din;

endmodule //matrixmul