/// @description draw player and list

if debugmode sprite_index = mask_index;

if !playermoving image_index = 0;

draw_self();

// list scroll animation
if listopen
{
	if listscroll < 144
	{
		listscroll += listscrollspeed;
	}
	draw_sprite(spr_list,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+144-listscroll);
	if global.itemmelk
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
	}
}
else
{
	if listscroll > 0
	{
		listscroll -= listscrollspeed;
		draw_sprite(spr_list,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+144-listscroll);
	}
}