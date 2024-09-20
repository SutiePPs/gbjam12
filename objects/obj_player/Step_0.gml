/// @description main player stuff


if firstload
{
	x = 400;
	y = 672;
	camera_set_view_pos(view_camera[0],320,576);
	firstload = false;
}

// debug commands for shifting palettes, remove later
if debugmode
{
	if keyboard_check_pressed(vk_space) show_debug_message(x);
	if keyboard_check_pressed(ord("T")) global.fadeshift -= 1;
	if keyboard_check_pressed(ord("Y")) global.fadeshift += 1;
	if keyboard_check_pressed(ord("G")) global.currentpalette -= 1;
	if keyboard_check_pressed(ord("H")) global.currentpalette += 1;
}

// check if hit a layer switcher
if place_meeting(x,y,obj_layerswitch)
{
	// get layer switcher instance
	var _layerinst = instance_place(x,y,obj_layerswitch);
	// deactivate all layers
	instance_deactivate_layer("NormalLayerA");
	instance_deactivate_layer("TrickLayer1A");
	// reactivate only the layer spcified in the layer switcher instance
	instance_activate_layer(_layerinst.targetlayer);
}

// check if hit an instant teleporter
if place_meeting(x,y,obj_instateleport)
{
	// get instant teleporter instance
	var _teleinst = instance_place(x,y,obj_instateleport);
	// move to specified offset in multiples of screen size
	x += _teleinst.xoffset*160;
	y += _teleinst.yoffset*144;
	// move camera too
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+_teleinst.xoffset*160,camera_get_view_y(view_camera[0])+_teleinst.yoffset*144);
}

// input stack
var _trash

// add inputs to stack
if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) array_push(controlarray,0);
if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) array_push(controlarray,1);
if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) array_push(controlarray,2);
if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) array_push(controlarray,3);

// delete released inputs from top of stack
if (keyboard_check_released(vk_left) or keyboard_check_released(ord("A"))) and controlarray[array_length(controlarray)-1] == 0 _trash = array_pop(controlarray);
if (keyboard_check_released(vk_right) or keyboard_check_released(ord("D"))) and controlarray[array_length(controlarray)-1] == 1 _trash = array_pop(controlarray);
if (keyboard_check_released(vk_up) or keyboard_check_released(ord("W"))) and controlarray[array_length(controlarray)-1] == 2 _trash = array_pop(controlarray);
if (keyboard_check_released(vk_down) or keyboard_check_released(ord("S"))) and controlarray[array_length(controlarray)-1] == 3 _trash = array_pop(controlarray);


// main controls
if !areatrans
{
	if !screentrans
	{
		playermoving = false;
		if !listopen
		{
			// main movement controls, comments apply to all directions
			if (keyboard_check(vk_left)or keyboard_check(ord("A"))) and controlarray[array_length(controlarray)-1] == 0
			{
				// store current sprite and mask to fall back on if unable to rotate
				var _mask = mask_index;
				var _sprite = sprite_index;
				// set new sprite and mask
				mask_index = spr_mask_player_left;
				sprite_index = spr_player_left;
				// collision detection
				if place_meeting(x,y,obj_wall) // if in wall now
				{
					if !place_meeting(x+24,y,obj_wall) // if there isn't a wall behind player too
					{
						// move player 1 pizel at a time until out of wall
						var _collisioncounter = 0;
						while place_meeting(x,y,obj_wall) and _collisioncounter < 24
						{
							x += 1;
							_collisioncounter += 1;
						}
					}
					else
					{
						// if player cant move, go back to old sprite and mask
						mask_index = _mask;
						sprite_index = _sprite;
					}
				}
				else
				{
					if !place_meeting(x-1,y,obj_wall) // if player can move, move
					{
						x -= movespeed;
						playermoving = true;
					}
				}
			}

			if (keyboard_check(vk_right) or keyboard_check(ord("D"))) and controlarray[array_length(controlarray)-1] == 1
			{
				var _mask = mask_index;
				var _sprite = sprite_index;
				mask_index = spr_mask_player_right;
				sprite_index = spr_player_right;
				if place_meeting(x,y,obj_wall)
				{
					if !place_meeting(x-24,y,obj_wall)
					{
						var _collisioncounter = 0;
						while place_meeting(x,y,obj_wall) and _collisioncounter < 24
						{
							x -= 1;
							_collisioncounter += 1;
						}
					}
					else
					{
						mask_index = _mask;
						sprite_index = _sprite;
					}
				}
				else
				{
					if !place_meeting(x+1,y,obj_wall)
					{
						x += movespeed;
						playermoving = true;
					}
				}
			}

			if (keyboard_check(vk_up) or keyboard_check(ord("W"))) and controlarray[array_length(controlarray)-1] == 2
			{
				var _mask = mask_index;
				var _sprite = sprite_index;
				mask_index = spr_mask_player_up;
				sprite_index = spr_player_up;
				if place_meeting(x,y,obj_wall)
				{
					if !place_meeting(x,y+24,obj_wall)
					{
						var _collisioncounter = 0;
						while place_meeting(x,y,obj_wall) and _collisioncounter < 32
						{
							y += 1;
							_collisioncounter += 1;
						}
					}
					else
					{
						mask_index = _mask;
						sprite_index = _sprite;
					}
				}
				else
				{
					if !place_meeting(x,y-1,obj_wall)
					{
						y -= movespeed;
						playermoving = true;
					}
				}
			}

			if (keyboard_check(vk_down) or keyboard_check(ord("S"))) and controlarray[array_length(controlarray)-1] == 3
			{
				var _mask = mask_index;
				var _sprite = sprite_index;
				mask_index = spr_mask_player_down;
				sprite_index = spr_player_down;
				if place_meeting(x,y,obj_wall)
				{
					if !place_meeting(x,y-24,obj_wall)
					{
						var _collisioncounter = 0;
						while place_meeting(x,y,obj_wall) and _collisioncounter < 32
						{
							y -= 1;
							_collisioncounter += 1;
						}
					}
					else
					{
						mask_index = _mask;
						sprite_index = _sprite;
					}
				}
				else
				{
					if !place_meeting(x,y+1,obj_wall)
					{
						y += movespeed;
						playermoving = true;
					}
				}
			}
	
	
			// check if player is at screen edges, then begin process of moving screen
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
			
			// check for items and checkout
			if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("J")))
			{
				if place_meeting(x,y,obj_item)
				{
					var _iteminst = instance_place(x,y,obj_item).itemname;
					var _listcount = 0;
					while _listcount < 12 and grocerylist[_listcount][0] != _iteminst
					{
						_listcount += 1;
					}
					if _listcount < 12 grocerylist[_listcount][1] = true;
				}
				
				if place_meeting(x,y,obj_checkout)
				{
					var _wincount = 0;
					while _wincount < 12 and grocerylist[_wincount][1] == true
					{
						_wincount += 1;
					}
					if _wincount >= 12 checkedout = true;
					
					if debugmode
					{
						show_debug_message(_wincount);
						if _wincount >= 12 show_debug_message("PP");
					}
				}
			}
			
			// check for area transitions
			if place_meeting(x,y,obj_areatrans)
			{
				areatrans = true;
				var _areatrans = instance_place(x,y,obj_areatrans);
				areatranspalette = _areatrans.areapalette;
				areatransx = _areatrans.xlocation;
				areatransy = _areatrans.ylocation;
				areatransroom = _areatrans.arearoom;
				playermoving = false;
			}
			
			if keyboard_check_pressed(global.selectbutton)
			{
				// open list
				if !areatrans and !screentrans listopen = true;
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
		// check which direction to move, then move both screen and player until screen is aligned with 160 x 144 grid
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
}
else
{
	// area transition fade and teleport effect
	areatranstimer += 1;
	if (areatranstimer - 1) mod areatranstimermark == 0 // if timer is a multiple of the set speed value
	{
		switch floor((areatranstimer - 1)/areatranstimermark) // check how far along it is
		{
			case 0: // fading out
				global.fadeshift -= 1;
				if debugmode show_debug_message(0);
			break;
			
			case 1:
				global.fadeshift -= 1;
				if debugmode show_debug_message(1);
			break;
			
			case 2:
				global.fadeshift -= 1;
				if debugmode show_debug_message(2);
			break;
			
			case 3: // black frame
				global.currentpalette = 3;
				if debugmode show_debug_message(3);
				// teleport player and camera
				room = areatransroom;
				x = areatransx;
				y = areatransy;
			break;
			
			case 4: // new palette
				switch areatranspalette
				{
					case "produce":
						global.currentpalette = 0;
					break;
					case "deli":
						global.currentpalette = 1;
					break;
					case "freezer":
						global.currentpalette = 2;
					break;
					case "storage":
						global.currentpalette = 3;
					break;
					case "bakery":
						global.currentpalette = 4;
					break;
					case "check":
						global.currentpalette = 5;
					break;
					default:
					break;
				}
				camera_set_view_pos(view_camera[0],(floor(areatransx/160))*160,(floor(areatransy/144))*144);
				if debugmode show_debug_message(4);
			break;
			
			case 5: // fade in
				global.fadeshift += 1;
				if debugmode show_debug_message(5);
			break;
			
			case 6:
				global.fadeshift += 1;
				if debugmode show_debug_message(6);
			break;
			
			case 7: // end
				global.fadeshift += 1;
				if debugmode show_debug_message(7);
				areatranstimer = 0;
				areatrans = false;
			break;
			
			default:
			break;
		}
	}
}

if place_meeting(x,y,obj_behindswitch)
{
	depth = 1000
}
else
{
	depth = 0;
}

if place_meeting(x,y,obj_exit)
{
	if checkedout
	{
		room = rm_win;
		instance_destroy(); // goodbye, world
	}
}