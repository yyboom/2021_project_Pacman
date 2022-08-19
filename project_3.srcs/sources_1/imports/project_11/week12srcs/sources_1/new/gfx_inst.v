`timescale 1ns / 1ps


module gfx(
    input wire BTN1,//btn[1]
    input wire BTN2,//btn[2]
    input wire BTN3,//btn[3]
    input wire BTN4,//btn[4]
    input wire [15:0] i_x,
    input wire [15:0] i_y,
    input wire i_v_sync,
    input wire i_h_sync,
    output reg [7:0] o_red,
    output reg [7:0] o_green,
    output reg [7:0] o_blue,
    output reg o_sprite_hit,
    output reg Eat 

    );

    wire bg_hit;
    wire sprite_hit, sprite_hit2, sprite_hit3, sprite_hit4, sprite_hit5;
    wire [7:0] bg_red;
    wire [7:0] bg_green;
    wire [7:0] bg_blue;
    wire [7:0] sprite_red;
    wire [7:0] sprite_green;
    wire [7:0] sprite_blue;
    wire [7:0] sprite_red2;
    wire [7:0] sprite_green2;
    wire [7:0] sprite_blue2;
    wire [7:0] sprite_red3;
    wire [7:0] sprite_green3;
    wire [7:0] sprite_blue3;
    wire [7:0] sprite_red4;
    wire [7:0] sprite_green4;
    wire [7:0] sprite_blue4;
    wire [7:0] sprite_red5;
    wire [7:0] sprite_green5;
    wire [7:0] sprite_blue5;
    wire [15:0] i_x_0;
    wire [15:0] i_y_0;
    wire [15:0] i_x_1;
    wire [15:0] i_y_1;
    wire [15:0] i_x_2;
    wire [15:0] i_y_2;
    wire [15:0] i_x_3;
    wire [15:0] i_y_3;
    wire [15:0] i_x_4;
    wire [15:0] i_y_4;
    wire [15:0]sprite_x_0;
    wire [15:0]sprite_y_0;
    wire [15:0]sprite_x_1;
    wire [15:0]sprite_y_1;
    wire [15:0]sprite_x_2;
    wire [15:0]sprite_y_2;
    wire [15:0]sprite_x_3;
    wire [15:0]sprite_y_3;
    wire [15:0]sprite_x_4;
    wire [15:0]sprite_y_4;
    reg Eat_0=0;
    reg Eat_1=0;
    reg Eat_2=0;
    reg Eat_3=0;
    
    

   
   test_card_simple test_card_simple_1(
            .i_x (i_x),
            .i_y (i_y),
            .o_red      (bg_red),
            .o_green    (bg_green),
            .o_blue     (bg_blue),
            .o_bg_hit   (bg_hit)
            );
  
     sprite_compositor sprite_compositor_0 (
        .BTN1       (BTN1),
        .BTN2       (BTN2),
        .BTN3       (BTN3),
        .BTN4       (BTN4),
        .i_x_0        (i_x),
        .i_y_0        (i_y),
        .i_v_sync   (i_v_sync),
        .i_h_sync   (i_h_sync),
        .o_red      (sprite_red),
        .o_green    (sprite_green),
        .o_blue     (sprite_blue),
        .o_sprite_hit   (sprite_hit),
        .sprite_x_0    (sprite_x_0),
        .sprite_y_0    (sprite_y_0)
        );
        
     cookie sprite_compositor_1 (
        .i_x_1        (i_x),
        .i_y_1        (i_y),
        .i_v_sync   (i_v_sync),
        .i_h_sync   (i_h_sync),
        .o_red      (sprite_red2),
        .o_green    (sprite_green2),
        .o_blue     (sprite_blue2),
        .o_sprite_hit   (sprite_hit2),
        .sprite_x_1    (sprite_x_1),
        .sprite_y_1    (sprite_y_1)
       );
        cookie2 sprite_compositor_2 (
        .i_x_2        (i_x),
        .i_y_2        (i_y),
        .i_v_sync   (i_v_sync),
        .o_red      (sprite_red3),
        .o_green    (sprite_green3),
        .o_blue     (sprite_blue3),
        .o_sprite_hit   (sprite_hit3),
        .sprite_x_2    (sprite_x_2),
        .sprite_y_2    (sprite_y_2)
       );
     cookie3 sprite_compositor_3 (
        .i_x_3        (i_x),
        .i_y_3        (i_y),
        .i_v_sync   (i_v_sync),
        .o_red      (sprite_red4),
        .o_green    (sprite_green4),
        .o_blue     (sprite_blue4),
        .o_sprite_hit   (sprite_hit4),
        .sprite_x_3    (sprite_x_3),
        .sprite_y_3    (sprite_y_3)
       );
     cookie4 sprite_compositor_4 (
        .i_x_4        (i_x),
        .i_y_4        (i_y),
        .i_v_sync   (i_v_sync),
        .o_red      (sprite_red5),
        .o_green    (sprite_green5),
        .o_blue     (sprite_blue5),
        .o_sprite_hit   (sprite_hit5),
        .sprite_x_4    (sprite_x_4),
        .sprite_y_4    (sprite_y_4)
       );

  
    always@(*) begin
    if (sprite_hit==1)begin
   // o_sprite_hit=1;
    o_red=sprite_red;
    o_green=sprite_green;
    o_blue=sprite_blue;
    end
    
    else if(sprite_hit2==1)begin
        if ((Eat_0==0)&&((sprite_x_1+5 < sprite_x_0)||(sprite_x_1 -5 >= sprite_x_0)||(sprite_y_1 +5 < sprite_y_0)||(sprite_y_1 -5 >= sprite_y_0)))begin
        Eat_0=0;
        o_red=sprite_red2;
        o_green=sprite_green2;
        o_blue=sprite_blue2;
        end
        else if (((sprite_x_1+5 >= sprite_x_0)&&(sprite_x_1 -5 < sprite_x_0))&&((sprite_y_1 +5 >= sprite_y_0)&&(sprite_y_1 -5 < sprite_y_0)))begin
        Eat_0=1;
        Eat<=1;
        // o_sprite_hit=0;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else if ((Eat_0==1))begin
       // Eat=Eat_0;
        Eat<=0;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else begin
        Eat_0=1;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
    end
    
    else if(sprite_hit3==1)begin
        if ((Eat_1==0)&&((sprite_x_2+5 < sprite_x_0)||(sprite_x_2 -5 >= sprite_x_0)||(sprite_y_2 +5 < sprite_y_0)||(sprite_y_2 -5 >= sprite_y_0)))begin
        Eat_1=0;
        o_red=sprite_red3;
        o_green=sprite_green3;
        o_blue=sprite_blue3;
        end
        else if (((sprite_x_2+5 >= sprite_x_0)&&(sprite_x_2 -5 < sprite_x_0))&&((sprite_y_2 +5 >= sprite_y_0)&&(sprite_y_2 -5 < sprite_y_0)))begin
        Eat_1=1;
        Eat<=1;
        // o_sprite_hit=0;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else if (Eat_1==1)begin
        Eat<=0;
       // Eat=Eat_1;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else begin
        Eat_1=1;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
    end
    else if(sprite_hit4==1)begin
        if ((Eat_2==0)&&((sprite_x_3+5 < sprite_x_0)||(sprite_x_3 -5 >= sprite_x_0)||(sprite_y_3 +5 < sprite_y_0)||(sprite_y_3 -5 >= sprite_y_0)))begin
        Eat_2=0;
        o_red=sprite_red4;
        o_green=sprite_green4;
        o_blue=sprite_blue4;
        end
        else if (((sprite_x_3+5 >= sprite_x_0)&&(sprite_x_3 -5 < sprite_x_0))&&((sprite_y_3 +5 >= sprite_y_0)&&(sprite_y_3 -5 < sprite_y_0)))begin
        Eat_2=1;
        Eat<=1;
        // o_sprite_hit=0;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else if ((Eat_2==1))begin
        Eat<=0;
       // Eat=Eat_2;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else begin
        Eat_2=1;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
    end
    else if(sprite_hit5==1)begin
        if ((Eat_3==0)&&((sprite_x_4+5 < sprite_x_0)||(sprite_x_4 -5 >= sprite_x_0)||(sprite_y_4 +5 < sprite_y_0)||(sprite_y_4 -5 >= sprite_y_0)))begin
        Eat_3=0;
        o_red=sprite_red5;
        o_green=sprite_green5;
        o_blue=sprite_blue5;
        end
        else if (((sprite_x_4+5 >= sprite_x_0)&&(sprite_x_4 -5 < sprite_x_0))&&((sprite_y_4 +5 >= sprite_y_0)&&(sprite_y_4 -5 < sprite_y_0)))begin
        Eat_3=1;
        Eat<=1;
        // o_sprite_hit=0;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else if ((Eat_3==1))begin
        Eat<=0;
       // Eat=Eat_3;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
        else begin
        Eat_3=1;
        o_red=bg_red;
        o_green=bg_green;
        o_blue=bg_blue;
        end
    end
    
    else begin
    o_red=bg_red;
    o_green=bg_green;
    o_blue=bg_blue;
    end
    
    end
    
endmodule