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
    //���� color�� �ּҰ��� ������, ���� table
        8'h00, 8'h00, 8'h00,
        8'hFF, 8'h00, 8'h00,
        8'hFF, 8'hFF, 8'hFF,
        8'h21, 8'h21, 8'hFF
    };
   
    localparam [0:15][0:15][3:0] sprite_data = {
    //������ ������ �ּҰ��� ������ data�� ���� pixel data
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
    assign sprite_hit_x = (i_x_0 >= sprite_x) && (i_x_0 < sprite_x + 64);//sprite�� x�� horizontal position, bandwidth:64
    assign sprite_hit_y = (i_y_0 >= sprite_y) && (i_y_0 < sprite_y + 64);//sprite�� y�� vertical position, bandwidth:64
    assign sprite_render_x = (i_x_0 - sprite_x)>>2;//sprite�� ������� x�� position
    assign sprite_render_y = (i_y_0 - sprite_y)>>2;//sprite�� ������� y�� position
    

    wire [1:0] selected_palette;
   //selected_palette�� ������ sprite_x(_y)_flip�� ����
   //sprite_render_x(_y)�� sprite_data�� ���ϴ� �����̴�.
    assign selected_palette = sprite_x_flip ? (sprite_y_flip ? sprite_data[15-sprite_render_y][15-sprite_render_x]: sprite_data[sprite_render_y][15-sprite_render_x])
                                                //sprite_x_flip:1, sprite_y_flip:0->x�� flip �߻�
                                            : (sprite_y_flip ? sprite_data[15-sprite_render_y][sprite_render_x]   : sprite_data[sprite_render_y][sprite_render_x]);
                                            //sprite_x_flip:0, sprite_y_flip:1->y�� flip �߻�
                                                                         
    assign o_red    = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][2] : 8'hXX;
    assign o_green  = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][1] : 8'hXX;
    assign o_blue   = (sprite_hit_x && sprite_hit_y) ? palette_colors[selected_palette][0] : 8'hXX;
    assign o_sprite_hit = (sprite_hit_y & sprite_hit_x) && (selected_palette != 2'd0);
    //sprite_hit_x(_y)�Ѵ� 1�� ��쿡 RGB data�� �����ȴ�. �� horizontal�� vertical beam position�� �����Ǿ��ٴ� �ǹ�
    //�̷��� �᠊�� ���� bitmap�� indexed color technique�� �̿��� palette_color���� output�� ������ �� �ִ�.
    //o_sprite_hit�� sprite_hit_x(_y)�� �� 1�϶��� selected palette�� 0�� �ƴ� data�� ���Ѵ�. 
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