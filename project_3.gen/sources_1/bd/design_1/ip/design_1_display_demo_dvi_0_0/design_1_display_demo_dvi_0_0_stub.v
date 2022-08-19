// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Jun 21 19:43:54 2021
// Host        : LAPTOP-TCM18FR1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/Vitis/project_11/project_11.gen/sources_1/bd/design_1/ip/design_1_display_demo_dvi_0_0/design_1_display_demo_dvi_0_0_stub.v
// Design      : design_1_display_demo_dvi_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "display_demo_dvi,Vivado 2020.2" *)
module design_1_display_demo_dvi_0_0(CLK, RST_BTN, btn1, btn2, btn3, btn4, hdmi_tx_cec, 
  hdmi_tx_hpd, hdmi_tx_rscl, hdmi_tx_rsda, hdmi_tx_clk_n, hdmi_tx_clk_p, hdmi_tx_n, hdmi_tx_p, 
  clk_lock, de, led, eat)
/* synthesis syn_black_box black_box_pad_pin="CLK,RST_BTN,btn1,btn2,btn3,btn4,hdmi_tx_cec,hdmi_tx_hpd,hdmi_tx_rscl,hdmi_tx_rsda,hdmi_tx_clk_n,hdmi_tx_clk_p,hdmi_tx_n[2:0],hdmi_tx_p[2:0],clk_lock,de,led,eat" */;
  input CLK;
  input RST_BTN;
  input btn1;
  input btn2;
  input btn3;
  input btn4;
  inout hdmi_tx_cec;
  input hdmi_tx_hpd;
  inout hdmi_tx_rscl;
  inout hdmi_tx_rsda;
  output hdmi_tx_clk_n;
  output hdmi_tx_clk_p;
  output [2:0]hdmi_tx_n;
  output [2:0]hdmi_tx_p;
  output clk_lock;
  output de;
  output led;
  output eat;
endmodule
