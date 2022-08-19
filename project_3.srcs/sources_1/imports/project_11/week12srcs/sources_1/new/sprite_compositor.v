`timescale 1ns / 1ps



module sprite_compositor(
    input wire BTN1,//btn[1]
    input wire BTN2,//btn[2]
    input wire BTN3,//btn[3]
    input wire BTN4,//btn[4]
    input wire [15:0] i_x_0,
    input wire [15:0] i_y_0,
    input wire i_v_sync,
    input wire i_h_sync,
    output wire [7:0] o_red,
    output wire [7:0] o_green,
    output wire [7:0] o_blue,
    output wire o_sprite_hit,
    output wire [15:0] sprite_x_0,
    output wire [15:0] sprite_y_0
    
    );
    
    reg [15:0] sprite_x     = 16'd00;
    reg [15:0] sprite_y     = 16'd00; 
    reg sprite_x_direction  = 1;
    reg sprite_y_direction  = 1;
    reg sprite_x_flip       = 0;
    reg sprite_y_flip       = 0;
    wire sprite_hit_x, sprite_hit_y;
    wire [3:0] sprite_render_x;
    wire [3:0] sprite_render_y;
    

    localparam [0:3][2:0][7:0] palette_colors =  {
    //먼저 color의 주소값을 저장함, 색상 table
        8'h00, 8'h00, 8'h00,
        8'hFF, 8'h00, 8'h00,
        8'hFF, 8'hFF, 8'hFF,
        8'h21, 8'h21, 8'hFF
    };
   
    localparam [0:15][0:15][3:0] sprite_data = {
    //위에서 저장한 주소값을 가지고 data를 넣음 pixel data
    4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,
    4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd1,4'd1,4'd1,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,
    4'd0,4'd0,4'd0,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd0,4'd0,4'd0,
    4'd0,4'd0,4'd1,4'd1,4'd1,4'd2,4'd2,4'd1,4'd1,4'd1,4'd1,4'd2,4'd2,4'd1,4'd0,4'd0,
    4'd0,4'd0,4'd1,4'd1,4'd2,4'd2,4'd2,4'd2,4'd1,4'd1,4'd2,4'd2,4'd2,4'd2,4'd0,4'd0,
    4'd0,4'd0,4'd1,4'd1,4'd2,4'd2,4'd3,4'd3,4'd1,4'd1,4'd2,4'd2,4'd3,4'd3,4'd0,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd2,4'd2,4'd3,4'd3,4'd1,4'd1,4'd2,4'd2,4'd3,4'd3,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd1,4'd2,4'd2,4'd1,4'd1,4'd1,4'd1,4'd2,4'd2,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd1,4'd0,4'd1,4'd1,4'd1,4'd0,4'd0,4'd1,4'd1,4'd1,4'd0,4'd1,4'd1,4'd0,
    4'd0,4'd1,4'd0,4'd0,4'd0,4'd1,4'd1,4'd0,4'd0,4'd1,4'd1,4'd0,4'd0,4'd0,4'd1,4'd0,
    4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0 
    };
    assign sprite_hit_x = (i_x_0 >= sprite_x) && (i_x_0 < sprite_x + 64);//sprite의 x축 horizontal position, bandwidth:64
    assign sprite_hit_y = (i_y_0 >= sprite_y) && (i_y_0 < sprite_y + 64);//sprite의 y축 vertical position, bandwidth:64
    assign sprite_render_x = (i_x_0 - sprite_x)>>2;//sprite가 만들어질 x축 position
    assign sprite_render_y = (i_y_0 - sprite_y)>>2;//sprite가 만들어질 y축 position
    

    wire [1:0] selected_palette;
   //selected_palette의 과정은 sprite_x(_y)_flip에 의해
   //sprite_render_x(_y)와 sprite_data를 정하는 과정이다.
    assign selected_palette = sprite_x_flip ? (sprite_y_flip ? sprite_data[15-sprite_render_y][15-sprite_render_x]: sprite_data[sprite_render_y][15-sprite_render_x])
                                                //sprite_x_flip:1, sprite_y_flip:0->x축 flip 발생
                                            : (sprite_y_flip ? sprite_data[15-sprite_render_y][sprite_render_x]   : sprite_data[sprite_render_y][sprite_render_x]);
                                            //sprite_x_flip:0, sprite_y_flip:1->y축 flip 발생
                                                                         
    assign o_red    = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][2] : 8'hXX;
    assign o_green  = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][1] : 8'hXX;
    assign o_blue   = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][0] : 8'hXX;
    assign o_sprite_hit = (sprite_hit_y & sprite_hit_x) && (selected_palette != 2'd0);
    //sprite_hit_x(_y)둘다 1일 경우에 RGB data가 결정된다. 즉 horizontal과 vertical beam position이 결정되었다는 의미
    //이렇게 결젇된 것은 bitmap의 indexed color technique을 이용해 palette_color에서 output을 결정할 수 있다.
    //o_sprite_hit은 sprite_hit_x(_y)가 다 1일때와 selected palette가 0이 아닌 data를 말한다. 
    assign sprite_x_0=sprite_x +1;
    assign sprite_y_0=sprite_y +1;

       
      always @(posedge i_v_sync) begin
        if (BTN1)
            begin
            if (sprite_x < 1280-64)
                sprite_x <= sprite_x+1;
            sprite_x_flip <=0;
            end
        else if (BTN2)
            begin
            if  (sprite_x >1)
                sprite_x <= sprite_x-1;
            sprite_x_flip <=1;
            end
        else if (BTN3)
            begin
            if (sprite_y <720-64)
                sprite_y <= sprite_y+1;
            sprite_y_flip <=0;
            end
        else if (BTN4)
            begin
            if (sprite_y >1)
                sprite_y <= sprite_y-1;
            sprite_y_flip <=1;
            end
        end
        
endmodule