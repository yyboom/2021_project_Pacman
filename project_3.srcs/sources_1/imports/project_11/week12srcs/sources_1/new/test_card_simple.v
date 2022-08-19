`timescale 1ns / 1ps
`default_nettype none


module test_card_simple #(H_RES=1280,V_RES=720) (
    input wire signed [15:0] i_x,
    input wire signed [15:0] i_y,
    output wire [7:0] o_red,
    output wire [7:0] o_green,
    output wire [7:0] o_blue,
    output wire o_bg_hit
    );

    localparam HW = H_RES >> 3;              // horizontal resolution (pixels)
    localparam VR = V_RES;              // vertical resolution (lines)
    localparam BW = 32;
    localparam HR = H_RES;
    localparam LS = 1;                // border width            
   // localparam SQ = VR >> 3;            // square unit
  //  localparam SX = (HR >> 1) - 5*SQ;   // square start horizontal
   // localparam SY = (VR >> 1) - 5*SQ;   // square start vertical
   // localparam LS = 2;                  // line spacing


    // Bands
    wire b0 = (i_x >= 0     ) & (i_x < HW    )& (i_y >= 0) & ( i_y <VR-BW);
    wire b1 = (i_x >= HW    ) & (i_x < HW * 2);
    wire b2 = (i_x >= HW * 2) & (i_x < HW * 3);
    wire b3 = (i_x >= HW * 3) & (i_x < HW * 4);
    wire b4 = (i_x >= HW * 4) & (i_x < HW * 5);
    wire b5 = (i_x >= HW * 5) & (i_x < HW * 6);
    wire b6 = (i_x >= HW * 6) & (i_x < HW * 7);
    wire b7 = (i_x >= HW * 7) & (i_x < HW * 8);
    //name                                                     2                            0                               1                              8                              2                               5                              1                               0                                 1                               6                                                                      
    wire n_y_4 =  (i_y >= VR-BW) & ( i_y <VR-BW+4)&((i_x >= 0) & (i_x < 15*LS)|(i_x >= 17*LS) & (i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x < 63*LS)|(i_x >= 65*LS) & (i_x < 79*LS)|(i_x >= 81*LS) & (i_x < 95*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS) & (i_x < 127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 158*LS));
    wire n_y_8 = (i_y >= VR-BW+4) & ( i_y <VR-BW+8)&((i_x >= 13*LS) & (i_x < 15*LS)|(i_x >= 17*LS) & (i_x < 19*LS)|(i_x >= 29*LS)&(i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x<51*LS)|(i_x>=61*LS)&(i_x < 63*LS)|(i_x >= 77*LS) & (i_x < 79*LS)|(i_x >= 81*LS) & (i_x < 83*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS) & (i_x < 115*LS)|(i_x>=125*LS)&(i_x<127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 147*LS));
    wire n_y_12 = (i_y >= VR-BW+8) & ( i_y <VR-BW+12)&((i_x >= 13*LS) & (i_x < 15*LS)|(i_x >= 17*LS)& (i_x < 19*LS)|(i_x >= 29*LS)&(i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x<51*LS)|(i_x>=61*LS)&(i_x < 63*LS)|(i_x >= 77*LS) & (i_x < 79*LS)|(i_x >= 81*LS) & (i_x < 83*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS) & (i_x < 115*LS)|(i_x>=125*LS)&(i_x<127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 147*LS));
    wire n_y_16 = (i_y >= VR-BW+12) & ( i_y <VR-BW+16)&((i_x >= 0) & (i_x < 15*LS)|(i_x >= 17*LS) & (i_x < 19*LS)|(i_x >= 29*LS)&(i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x < 63*LS)|(i_x >= 65*LS) & (i_x < 79*LS)|(i_x >= 81*LS) & (i_x < 95*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS)&(i_x < 115*LS)|(i_x>=125*LS)&(i_x<127*LS) |(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 158*LS));
    wire n_y_20 = (i_y >= VR-BW+16) & ( i_y <VR-BW+20)&((i_x >= 0) & (i_x < 2*LS)|(i_x >= 17*LS) & (i_x < 19*LS)|(i_x >= 29*LS)& (i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x<51*LS)|(i_x>=61*LS)& (i_x < 63*LS)|(i_x >= 65*LS) & (i_x < 67*LS)|(i_x >= 93*LS) & (i_x < 95*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS)&(i_x < 115*LS)|(i_x>=125*LS) & (i_x < 127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 147*LS)|(i_x >= 156*LS) & (i_x < 158*LS));
    wire n_y_24 = (i_y >= VR-BW+20) & ( i_y <VR-BW+24)&((i_x >= 0) & (i_x < 2*LS)|(i_x >= 17*LS) & (i_x < 19*LS)|(i_x >= 29*LS)& (i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x<51*LS)|(i_x>=61*LS)& (i_x < 63*LS)|(i_x >= 65*LS) & (i_x < 67*LS)|(i_x >= 93*LS) & (i_x < 95*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS) &(i_x < 115*LS)|(i_x>=125*LS)& (i_x < 127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 147*LS)|(i_x >= 156*LS) & (i_x < 158*LS));
    wire n_y_28 = (i_y >= VR-BW+24) & ( i_y <VR-BW+28)&((i_x >= 0) & (i_x < 15*LS)|(i_x >= 17*LS) & (i_x < 31*LS)|(i_x >= 40*LS) & (i_x < 42*LS)|(i_x >= 49*LS) & (i_x < 63*LS)|(i_x >= 65*LS) & (i_x < 79*LS)|(i_x >= 81*LS) & (i_x < 95*LS)|(i_x >= 104*LS) & (i_x < 106*LS)|(i_x >= 113*LS) & (i_x < 127*LS)|(i_x >= 134*LS) & (i_x < 136*LS)|(i_x >= 145*LS) & (i_x < 158*LS));

    // Colour Output
    assign o_red    = {8{n_y_4 | n_y_8 | n_y_12 | n_y_16 | n_y_20 | n_y_24 | n_y_28 | b0 | b1 | b5}} + {2'b0,{6{b6}}} + {b7, 7'b0};
    assign o_green  = {8{n_y_4 | n_y_8 | n_y_12 | n_y_16 | n_y_20 | n_y_24 | n_y_28 | b1 | b2 | b3}} + {2'b0,{6{b6}}} + {b7, 7'b0};
    assign o_blue   = {8{n_y_4 | n_y_8 | n_y_12 | n_y_16 | n_y_20 | n_y_24 | n_y_28 | b3 | b4 | b5}} + {2'b0,{6{b6}}} + {b7, 7'b0};
endmodule
