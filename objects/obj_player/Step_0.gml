/// @description main player stuff

if place_meeting(x,y,obj_layerswitch)
{
	var _layerinst = instance_place(x,y,obj_layerswitch);
	instance_deactivate_layer("NormalLayerA");
	instance_deactivate_layer("TrickLayer1A");
	instance_activate_layer(_layerinst.targetlayer);
}


if !screentrans
{
	if !listopen
	{
		//very basic movement
		if keyboard_check(global.leftbutton) and !place_meeting(x-movespeed,y,obj_wall)
		{
			x -= movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_left;
			if !place_meeting(x,y,obj_wall) and !keyboard_check(global.upbutton) and !keyboard_check(global.downbutton)
			{
				sprite_index = spr_player_left;
			}
			else
			{
				mask_index = _mask;
			}
		}

		if keyboard_check(global.rightbutton) and !place_meeting(x+movespeed,y,obj_wall)
		{
			x += movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_right;
			if !place_meeting(x,y,obj_wall) and !keyboard_check(global.upbutton) and !keyboard_check(global.downbutton)
			{
				sprite_index = spr_player_right;
			}
			else
			{
				mask_index = _mask;
			}
		}

		if keyboard_check(global.upbutton) and !place_meeting(x,y-movespeed,obj_wall)
		{
			y -= movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_up;
			if !place_meeting(x,y,obj_wall) and !keyboard_check(global.leftbutton) and !keyboard_check(global.rightbutton)
			{
				sprite_index = spr_player_up;
			}
			else
			{
				mask_index = _mask;
			}
		}

		if keyboard_check(global.downbutton) and !place_meeting(x,y+movespeed,obj_wall)
		{
			y += movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_down;
			if !place_meeting(x,y,obj_wall) and !keyboard_check(global.leftbutton) and !keyboard_check(global.rightbutton)
			{
				sprite_index = spr_player_down;
			}
			else
			{
				mask_index = _mask;
			}
		}
	
	
		//check if player is at screen edges, then begin process of moving screen
		if x-camera_get_view_x(view_camera[0]) <= 8
		{
			screentrans = true;
			screentransdir = "left";
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-screentranspeedh,camera_get_view_y(view_camera[0]));
		}

		if x-camera_get_view_x(view_camera[0]) >= 152
		{
			screentrans = true;
			screentransdir = "right";
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+screentranspeedh,camera_get_view_y(view_camera[0]));
		}

		if y-camera_get_view_y(view_camera[0]) <= 8
		{
			screentrans = true;
			screentransdir = "up";
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-screentranspeedv);
		}

		if y-camera_get_view_y(view_camera[0]) >= 136
		{
			screentrans = true;
			screentransdir = "down";
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+screentranspeedv);
		}
		
		if keyboard_check_pressed(global.abutton)
		{
			if place_meeting(x,y,obj_item)
			{
				var _iteminst = instance_place(x,y,obj_item);
				switch _iteminst.itemname
				{
					case "bread":
						global.itembread = true;
					break;
					case "fishe":
						global.itemfishe = true;
					break;
					case "melk":
						global.itemmelk = true;
					break;
				}
				instance_destroy(_iteminst);
			}
		}
			
		if keyboard_check_pressed(global.selectbutton)
		{
			listopen = true;
		}
	}
	else
	{
		if keyboard_check_pressed(global.selectbutton)
		{
			listopen = false;
		}
	}
}
else
{
	//check which direction to move, then move both screen and player until screen is aligned with 160 x 144 grid
	switch screentransdir
	{
		case "left":
			if camera_get_view_x(view_camera[0]) mod 160 != 0
			{
				camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-screentranspeedh,camera_get_view_y(view_camera[0]));
				x -= screentransmovespeedh;
			}
			else
			{
				screentrans = false;
				x = round(x);
			}
		break;
		case "right":
			if camera_get_view_x(view_camera[0]) mod 160 != 0
			{
				camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+screentranspeedh,camera_get_view_y(view_camera[0]));
				x += screentransmovespeedh;
			}
			else
			{
				screentrans = false;
				x = round(x);
			}
		break;
		case "up":
			if camera_get_view_y(view_camera[0]) mod 144 != 0
			{
				camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-screentranspeedv);
				y -= screentransmovespeedv;
			}
			else
			{
				screentrans = false;
				y = round(y);
			}
		break;
		case "down":
			if camera_get_view_y(view_camera[0]) mod 144 != 0
			{
				camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+screentranspeedv);
				y += screentransmovespeedv;
			}
			else
			{
				screentrans = false;
				y = round(y);
			}
		break;
	}
}

//unused hard cut screen transitions
/*
if x > camera_get_view_x(view_camera[0])+160
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+160,camera_get_view_y(view_camera[0]));
//	x += 8;
}

if x < camera_get_view_x(view_camera[0])
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-160,camera_get_view_y(view_camera[0]));
//	x -= 8;
}

if y > camera_get_view_y(view_camera[0])+144
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+144);
//	y += 8;
}

if y < camera_get_view_y(view_camera[0])
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-144);
//	y -= 8;
}
*/