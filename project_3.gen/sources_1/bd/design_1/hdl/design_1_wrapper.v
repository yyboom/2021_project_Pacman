//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Jun 21 20:15:06 2021
//Host        : LAPTOP-TCM18FR1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    Irclk,
    RST_BTN,
    bclk,
    btn1,
    btn2,
    btn3,
    btn4,
    clk_lock,
    de,
    eat,
    hdmi_tx_cec,
    hdmi_tx_clk_n,
    hdmi_tx_clk_p,
    hdmi_tx_hpd,
    hdmi_tx_n,
    hdmi_tx_p,
    hdmi_tx_rscl,
    hdmi_tx_rsda,
    led,
    mclk,
    miso,
    mosi,
    sclk,
    sdata,
    ss);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output Irclk;
  input RST_BTN;
  output bclk;
  input btn1;
  input btn2;
  input btn3;
  input btn4;
  output clk_lock;
  output de;
  output eat;
  inout hdmi_tx_cec;
  output hdmi_tx_clk_n;
  output hdmi_tx_clk_p;
  input hdmi_tx_hpd;
  output [2:0]hdmi_tx_n;
  output [2:0]hdmi_tx_p;
  inout hdmi_tx_rscl;
  inout hdmi_tx_rsda;
  output led;
  output mclk;
  input miso;
  output mosi;
  output sclk;
  output sdata;
  output ss;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire Irclk;
  wire RST_BTN;
  wire bclk;
  wire btn1;
  wire btn2;
  wire btn3;
  wire btn4;
  wire clk_lock;
  wire de;
  wire eat;
  wire hdmi_tx_cec;
  wire hdmi_tx_clk_n;
  wire hdmi_tx_clk_p;
  wire hdmi_tx_hpd;
  wire [2:0]hdmi_tx_n;
  wire [2:0]hdmi_tx_p;
  wire hdmi_tx_rscl;
  wire hdmi_tx_rsda;
  wire led;
  wire mclk;
  wire miso;
  wire mosi;
  wire sclk;
  wire sdata;
  wire ss;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .Irclk(Irclk),
        .RST_BTN(RST_BTN),
        .bclk(bclk),
        .btn1(btn1),
        .btn2(btn2),
        .btn3(btn3),
        .btn4(btn4),
        .clk_lock(clk_lock),
        .de(de),
        .eat(eat),
        .hdmi_tx_cec(hdmi_tx_cec),
        .hdmi_tx_clk_n(hdmi_tx_clk_n),
        .hdmi_tx_clk_p(hdmi_tx_clk_p),
        .hdmi_tx_hpd(hdmi_tx_hpd),
        .hdmi_tx_n(hdmi_tx_n),
        .hdmi_tx_p(hdmi_tx_p),
        .hdmi_tx_rscl(hdmi_tx_rscl),
        .hdmi_tx_rsda(hdmi_tx_rsda),
        .led(led),
        .mclk(mclk),
        .miso(miso),
        .mosi(mosi),
        .sclk(sclk),
        .sdata(sdata),
        .ss(ss));
endmodule
