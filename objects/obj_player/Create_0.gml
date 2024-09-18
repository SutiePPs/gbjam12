/// @description set up variables

debugmode = false;

movespeed = 1;
playermoving = false;

listopen = false;
listscroll = 0;
listscrollspeed = 8;

screentrans = false;
screentransdir = 0;
screentranspeedh = 4;
screentransmovespeedh = 0.45;
screentranspeedv = 4;
screentransmovespeedv = 0.5;

areatrans = false;
areatranstimer = 0;
areatranstimermark = 4;
areatranspalette = 0;
areatransx = 0;
areatransy = 0;

controlarray = [0];


// leave only the main layer active
instance_deactivate_layer("TrickLayer1A");