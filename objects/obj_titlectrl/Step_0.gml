/// @description menuing

// press start to start !
if (keyboard_check(vk_enter) or keyboard_check(vk_space) or keyboard_check(ord("Z")) or keyboard_check(ord("J")))
{
	room = rm_playerinit;
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
