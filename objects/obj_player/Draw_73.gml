/// @description draw list

// list scroll animation
if listopen
{
	if listscroll < 144
	{
		listscroll += listscrollspeed;
	}
	/*if global.itemmelk
	{
		draw_sprite(spr_check,0,camera_get_view_x(view_camera[0])+133,camera_get_view_y(view_camera[0])+36+144-listscroll);
	}
	if global.itembread
	{
		draw_sprite(spr_check,0,camera_get_view_x(view_camera[0])+130,camera_get_view_y(view_camera[0])+73+144-listscroll);
	}
	if global.itemfishe
	{
		draw_sprite(spr_check,0,camera_get_view_x(view_camera[0])+127,camera_get_view_y(view_camera[0])+106+144-listscroll);
	}*/
}
if listscroll > 0
{
	if !listopen listscroll -= listscrollspeed;
	draw_sprite(spr_list,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+144-listscroll);
		
	draw_set_color(c_black)
	var _i = 0;
	while _i < 12
	{
		if grocerylist[_i][1]
		{
			draw_rectangle(camera_get_view_x(view_camera[0])+26,camera_get_view_y(view_camera[0])+158-listscroll+(_i*10),camera_get_view_x(view_camera[0])+120,camera_get_view_y(view_camera[0])+159-listscroll+(_i*10),false)
		}
		draw_text(camera_get_view_x(view_camera[0])+30,camera_get_view_y(view_camera[0])+154-listscroll+(_i*10),grocerylist[_i][0]);
		_i += 1;
	}
	draw_set_color(c_white)
}