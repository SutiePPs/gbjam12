/// @description palette variables

palettesurface = -1;
global.currentpalette = 0;
global.fadeshift = 0;
shader_palette_colblack = shader_get_uniform(sh_gb, "pal_colblack");
shader_palette_coldgray = shader_get_uniform(sh_gb, "pal_coldgray");
shader_palette_collgray = shader_get_uniform(sh_gb, "pal_collgray");
shader_palette_colwhite = shader_get_uniform(sh_gb, "pal_colwhite");

produce_a = 30.0;

//produce
palettearray[0][0] = 30.0/255.0;
palettearray[0][1] = 73.0/255.0;
palettearray[0][2] = 89.0/255.0;

palettearray[0][3] = 59.0/255.0;
palettearray[0][4] = 161.0/255.0;
palettearray[0][5] = 85.0/255.0;

palettearray[0][6] = 160.0/255.0;
palettearray[0][7] = 199.0/255.0;
palettearray[0][8] = 111.0/255.0;

palettearray[0][9] = 235.0/255.0;
palettearray[0][10] = 224.0/255.0;
palettearray[0][11] = 178.0/255.0;


//deli
palettearray[1][0] = 142.0/255.0;
palettearray[1][1] = 20.0/255.0;
palettearray[1][2] = 56.0/255.0;

palettearray[1][3] = 232.0/255.0;
palettearray[1][4] = 75.0/255.0;
palettearray[1][5] = 106.0/255.0;

palettearray[1][6] = 252.0/255.0;
palettearray[1][7] = 146.0/255.0;
palettearray[1][8] = 163.0/255.0;

palettearray[1][9] = 247.0/255.0;
palettearray[1][10] = 215.0/255.0;
palettearray[1][11] = 219.0/255.0;


//cold
palettearray[2][0] = 19.0/255.0;
palettearray[2][1] = 20.0/255.0;
palettearray[2][2] = 87.0/255.0;

palettearray[2][3] = 67.0/255.0;
palettearray[2][4] = 59.0/255.0;
palettearray[2][5] = 255.0/255.0;

palettearray[2][6] = 143.0/255.0;
palettearray[2][7] = 148.0/255.0;
palettearray[2][8] = 197.0/255.0;

palettearray[2][9] = 255.0/255.0;
palettearray[2][10] = 255.0/255.0;
palettearray[2][11] = 245.0/255.0;


//storage
palettearray[3][0] = 33.0/255.0;
palettearray[3][1] = 31.0/255.0;
palettearray[3][2] = 31.0/255.0;

palettearray[3][3] = 55.0/255.0;
palettearray[3][4] = 44.0/255.0;
palettearray[3][5] = 56.0/255.0;

palettearray[3][6] = 122.0/255.0;
palettearray[3][7] = 114.0/255.0;
palettearray[3][8] = 114.0/255.0;

palettearray[3][9] = 171.0/255.0;
palettearray[3][10] = 171.0/255.0;
palettearray[3][11] = 171.0/255.0;


//bakery
palettearray[4][0] = 33.0/255.0;
palettearray[4][1] = 18.0/255.0;
palettearray[4][2] = 16.0/255.0;

palettearray[4][3] = 94.0/255.0;
palettearray[4][4] = 45.0/255.0;
palettearray[4][5] = 32.0/255.0;

palettearray[4][6] = 199.0/255.0;
palettearray[4][7] = 107.0/255.0;
palettearray[4][8] = 42.0/255.0;

palettearray[4][9] = 240.0/255.0;
palettearray[4][10] = 194.0/255.0;
palettearray[4][11] = 96.0/255.0;


//checkout
palettearray[5][0] = 41.0/255.0;
palettearray[5][1] = 26.0/255.0;
palettearray[5][2] = 31.0/255.0;

palettearray[5][3] = 103.0/255.0;
palettearray[5][4] = 86.0/255.0;
palettearray[5][5] = 80.0/255.0;

palettearray[5][6] = 190.0/255.0;
palettearray[5][7] = 168.0/255.0;
palettearray[5][8] = 125.0/255.0;

palettearray[5][9] = 240.0/255.0;
palettearray[5][10] = 224.0/255.0;
palettearray[5][11] = 207.0/255.0;