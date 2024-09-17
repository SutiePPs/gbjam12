/// @description main player stuff

if place_meeting(x,y,obj_layerswitch)
{
	var _layerinst = instance_place(x,y,obj_layerswitch);
	instance_deactivate_layer("NormalLayerA");
	instance_deactivate_layer("TrickLayer1A");
	instance_activate_layer(_layerinst.targetlayer);
}

if place_meeting(x,y,obj_instateleport)
{
	var _teleinst = instance_place(x,y,obj_instateleport);
	x += _teleinst.xoffset*160;
	y += _teleinst.yoffset*144;
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+_teleinst.xoffset*160,camera_get_view_y(view_camera[0])+_teleinst.yoffset*144);
}

var _trash
if keyboard_check_pressed(global.leftbutton) array_push(controlarray,0);
if keyboard_check_pressed(global.rightbutton) array_push(controlarray,1);
if keyboard_check_pressed(global.upbutton) array_push(controlarray,2);
if keyboard_check_pressed(global.downbutton) array_push(controlarray,3);

if keyboard_check_released(global.leftbutton) and controlarray[array_length(controlarray)-1] == 0 _trash = array_pop(controlarray);
if keyboard_check_released(global.rightbutton) and controlarray[array_length(controlarray)-1] == 1 _trash = array_pop(controlarray);
if keyboard_check_released(global.upbutton) and controlarray[array_length(controlarray)-1] == 2 _trash = array_pop(controlarray);
if keyboard_check_released(global.downbutton) and controlarray[array_length(controlarray)-1] == 3 _trash = array_pop(controlarray);


if !screentrans
{
	playermoving = false;
	if !listopen
	{
		if keyboard_check(global.leftbutton) and controlarray[array_length(controlarray)-1] == 0
		{
			x -= movespeed;
			mask_index = spr_mask_player_left;
			sprite_index = spr_player_left;
			if place_meeting(x,y,obj_wall)
			{
				//var _leftplace = position_meeting(x-16,y,obj_wall)
				//var _rightplace = position_meeting(x+16,y,obj_wall)
				var _collisioncounter = 0;
				while place_meeting(x,y,obj_wall) and _collisioncounter < 64
				{
					x += 1;
					_collisioncounter += 1;
				}
			}
			else
			{
				playermoving = true;
			}
		}

		if keyboard_check(global.rightbutton) and controlarray[array_length(controlarray)-1] == 1
		{
			x += movespeed;
			mask_index = spr_mask_player_right;
			sprite_index = spr_player_right;
			if place_meeting(x,y,obj_wall)
			{
				//var _leftplace = position_meeting(x-16,y,obj_wall)
				//var _rightplace = position_meeting(x+16,y,obj_wall)
				var _collisioncounter = 0;
				while place_meeting(x,y,obj_wall) and _collisioncounter < 64
				{
					x -= 1;
					_collisioncounter += 1;
				}
			}
			else
			{
				playermoving = true;
			}
		}

		if keyboard_check(global.upbutton) and controlarray[array_length(controlarray)-1] == 2
		{
			y -= movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_up;
			sprite_index = spr_player_up;
			if place_meeting(x,y,obj_wall)
			{
				//var _leftplace = position_meeting(x-16,y,obj_wall)
				//var _rightplace = position_meeting(x+16,y,obj_wall)
				var _collisioncounter = 0;
				while place_meeting(x,y,obj_wall) and _collisioncounter < 64
				{
					y += 1;
					_collisioncounter += 1;
				}
			}
			else
			{
				playermoving = true;
			}
		}

		if keyboard_check(global.downbutton) and controlarray[array_length(controlarray)-1] == 3
		{
			y += movespeed;
			var _mask = mask_index;
			mask_index = spr_mask_player_down;
			sprite_index = spr_player_down;
			if place_meeting(x,y,obj_wall)
			{
				//var _leftplace = position_meeting(x-16,y,obj_wall)
				//var _rightplace = position_meeting(x+16,y,obj_wall)
				var _collisioncounter = 0;
				while place_meeting(x,y,obj_wall) and _collisioncounter < 64
				{
					y -= 1;
					_collisioncounter += 1;
				}
			}
			else
			{
				playermoving = true;
			}
		}
	
	
		//check if player is at screen edges, then begin process of moving screen
		if x-camera_get_view_x(view_camera[0]) <= 8
		{
			screentrans = true;
			screentransdir = 0;
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-screentranspeedh,camera_get_view_y(view_camera[0]));
		}

		if x-camera_get_view_x(view_camera[0]) >= 152
		{
			screentrans = true;
			screentransdir = 1;
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+screentranspeedh,camera_get_view_y(view_camera[0]));
		}

		if y-camera_get_view_y(view_camera[0]) <= 8
		{
			screentrans = true;
			screentransdir = 2;
			camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])-screentranspeedv);
		}

		if y-camera_get_view_y(view_camera[0]) >= 136
		{
			screentrans = true;
			screentransdir = 3;
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
		case 0:
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
		case 1:
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
		case 2:
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
		case 3:
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