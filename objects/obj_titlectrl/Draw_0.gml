/// @description draw stuffs


// unused menuing

/*draw_set_font(fnt_main);
draw_set_color(c_black);

var _mcount = 0;

while _mcount <= menuoptionmax
{
	draw_text(8,96+(_mcount*8),menuoption[_mcount]);
	_mcount += 1;
}

draw_sprite(spr_menuarrow,0,0,96+(menuoptioncurrent*8))