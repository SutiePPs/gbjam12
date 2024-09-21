/// @description draw variables for debugging

if debugmode
{
	draw_set_color(c_purple)

	draw_text(0,0,x);
	draw_text(0,20,y);
	draw_text(0,40,camera_get_view_x(view_camera[0]));
	draw_text(0,60,camera_get_view_y(view_camera[0]));

	/*draw_text(100,0,global.itembread);
	draw_text(100,20,global.itemfishe);
	draw_text(100,40,global.itemmelk);*/

	draw_text(150,0,controlarray[array_length(controlarray)-1]);
	draw_text(150,20,array_length(controlarray));

	draw_text(200,0,areatrans);
	draw_text(200,20,(areatranstimer - 1));
	
	draw_text(300,0,random_get_seed());
	draw_text(300,20,array_length(grocerylist));
	
	var _i = 0;
	while _i < 12
	{
		draw_text(50,50+(_i*20),grocerylist[_i]);
		_i += 1;
	}
	
	draw_set_color(c_white)
}