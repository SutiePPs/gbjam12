/// @description draw onto surface for palette

if !surface_exists(palettesurface)
{
	palettesurface = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
}
surface_copy(palettesurface,0,0,application_surface);
shader_set(sh_gb);
switch global.fadeshift
{
	case -3:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
	break;
	
	case -2:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][3],palettearray[global.currentpalette][4],palettearray[global.currentpalette][5],255.0/255.0]);
	break;
	
	case -1:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][3],palettearray[global.currentpalette][4],palettearray[global.currentpalette][5],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][6],palettearray[global.currentpalette][7],palettearray[global.currentpalette][8],255.0/255.0]);
	break;
	
	case 0:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][3],palettearray[global.currentpalette][4],palettearray[global.currentpalette][5],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][6],palettearray[global.currentpalette][7],palettearray[global.currentpalette][8],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
	break;
	
	case 1:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][3],palettearray[global.currentpalette][4],palettearray[global.currentpalette][5],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][6],palettearray[global.currentpalette][7],palettearray[global.currentpalette][8],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
	break;
	
	case 2:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][6],palettearray[global.currentpalette][7],palettearray[global.currentpalette][8],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
	break;
	
	case 3:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
	break;
	
	default:
		shader_set_uniform_f_array(shader_palette_colblack,[palettearray[global.currentpalette][0],palettearray[global.currentpalette][1],palettearray[global.currentpalette][2],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[global.currentpalette][3],palettearray[global.currentpalette][4],palettearray[global.currentpalette][5],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_collgray,[palettearray[global.currentpalette][6],palettearray[global.currentpalette][7],palettearray[global.currentpalette][8],255.0/255.0]);
		shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[global.currentpalette][9],palettearray[global.currentpalette][10],palettearray[global.currentpalette][11],255.0/255.0]);
	break;
}
draw_surface(palettesurface,0,0);
shader_reset();
surface_free(palettesurface);

/*
/// @description draw onto surface for palette

if !surface_exists(palettesurface)
{
	palettesurface = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
}
surface_copy(palettesurface,0,0,application_surface);
shader_set(sh_gb);
shader_set_uniform_f_array(shader_palette_colblack,[palettearray[0][0],palettearray[0][1],palettearray[0][2],255.0]);
shader_set_uniform_f_array(shader_palette_coldgray,[palettearray[0][3],palettearray[0][4],palettearray[0][5],255.0]);
shader_set_uniform_f_array(shader_palette_collgray,[palettearray[0][6],palettearray[0][7],palettearray[0][8],255.0]);
shader_set_uniform_f_array(shader_palette_colwhite,[palettearray[0][9],palettearray[0][10],palettearray[0][11],255.0]);
draw_surface(palettesurface,0,0);
shader_reset();
surface_free(palettesurface);