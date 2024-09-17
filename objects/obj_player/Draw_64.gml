/// @description draw variables for debugging

draw_set_color(c_gray)

draw_text(0,0,x);
draw_text(0,20,y);
draw_text(0,40,camera_get_view_x(view_camera[0]));
draw_text(0,60,camera_get_view_y(view_camera[0]));

draw_text(150,0,global.itembread);
draw_text(150,20,global.itemfishe);
draw_text(150,40,global.itemmelk);

draw_set_color(c_white)