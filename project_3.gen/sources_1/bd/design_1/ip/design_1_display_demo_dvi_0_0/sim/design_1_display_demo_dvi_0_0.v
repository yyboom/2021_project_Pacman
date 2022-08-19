// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:display_demo_dvi:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_display_demo_dvi_0_0 (
  CLK,
  RST_BTN,
  btn1,
  btn2,
  btn3,
  btn4,
  hdmi_tx_cec,
  hdmi_tx_hpd,
  hdmi_tx_rscl,
  hdmi_tx_rsda,
  hdmi_tx_clk_n,
  hdmi_tx_clk_p,
  hdmi_tx_n,
  hdmi_tx_p,
  clk_lock,
  de,
  led,
  eat
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *)
input wire CLK;
input wire RST_BTN;
input wire btn1;
input wire btn2;
input wire btn3;
input wire btn4;
inout wire hdmi_tx_cec;
input wire hdmi_tx_hpd;
inout wire hdmi_tx_rscl;
inout wire hdmi_tx_rsda;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hdmi_tx_clk_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_display_demo_dvi_0_0_hdmi_tx_clk_n, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 hdmi_tx_clk_n CLK" *)
output wire hdmi_tx_clk_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hdmi_tx_clk_p, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_display_demo_dvi_0_0_hdmi_tx_clk_p, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 hdmi_tx_clk_p CLK" *)
output wire hdmi_tx_clk_p;
output wire [2 : 0] hdmi_tx_n;
output wire [2 : 0] hdmi_tx_p;
output wire clk_lock;
output wire de;
output wire led;
output wire eat;

  display_demo_dvi inst (
    .CLK(CLK),
    .RST_BTN(RST_BTN),
    .btn1(btn1),
    .btn2(btn2),
    .btn3(btn3),
    .btn4(btn4),
    .hdmi_tx_cec(hdmi_tx_cec),
    .hdmi_tx_hpd(hdmi_tx_hpd),
    .hdmi_tx_rscl(hdmi_tx_rscl),
    .hdmi_tx_rsda(hdmi_tx_rsda),
    .hdmi_tx_clk_n(hdmi_tx_clk_n),
    .hdmi_tx_clk_p(hdmi_tx_clk_p),
    .hdmi_tx_n(hdmi_tx_n),
    .hdmi_tx_p(hdmi_tx_p),
    .clk_lock(clk_lock),
    .de(de),
    .led(led),
    .eat(eat)
  );
endmodule
