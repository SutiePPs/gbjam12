/// @description menuing

// press start to start !
if keyboard_check_pressed(global.startbutton)
{
	room = rm_game;
}

// unused menu system before i asked for other opinions ><

/*if global.selectbutton or global.downbutton
{
	menuoptioncurrent += 1;
	if menuoptioncurrent > menuoptionmax
	{
		menuoptioncurrent = 0;
	}
}

if global.upbutton
{
	menuoptioncurrent -= 1;
	if menuoptioncurrent < 0
	{
		menuoptioncurrent = menuoptionmax;
	}
}
