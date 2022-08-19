`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 20:53:47
// Design Name: 
// Module Name: test_card_black
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_card_black(
    input wire signed [15:0] i_x,
    output wire [7:0] o_red,
    output wire [7:0] o_green,
    output wire [7:0] o_blue,
    output wire o_bg_hit
    );
    assign o_red    = 8'hFF;
    assign o_green  = 8'hFF;
    assign o_blue   = 8'hFF;
    assign o_bg_hit = 1;  
    
endmodule
