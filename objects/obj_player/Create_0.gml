/// @description hello, world

debugmode = false;
 
movespeed = 1;
if debugmode movespeed = 4;
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
areatransroom = rm_check;

controlarray = [0];
depth = 0;

room = rm_check;
firstload = true;

audio_play_sound(snd_mus_main, 1, true);



// list init
grocerylist = [0][0] = 0;
possibleitems[0][0] = "appl";
possibleitems[0][1] = "onion";
possibleitems[0][2] = "orange";
possibleitems[0][3] = "banana";
possibleitems[1][0] = "bread";
possibleitems[1][1] = "loaf";
possibleitems[1][2] = "cookie";
possibleitems[1][3] = "cake";
possibleitems[2][0] = "meat";
possibleitems[2][1] = "chicken";
possibleitems[2][2] = "fish";
possibleitems[2][3] = "shrimp";
possibleitems[3][0] = "melk";
possibleitems[3][1] = "bottle";
possibleitems[3][2] = "can";
possibleitems[3][3] = "eg";
possibleitems[4][0] = "candy";
possibleitems[4][1] = "lollipop";
possibleitems[4][2] = "chocolate";
possibleitems[4][3] = "magazine";
possibleitems[5][0] = "toiletpaper";
possibleitems[5][1] = "flower";
possibleitems[5][2] = "tissue";
possibleitems[5][3] = "bean";


//random_set_seed(1);
randomize();

var _listnum = 0;
var _category = 0;
var _rand = irandom_range(0,3);
while _listnum < 12 //pick two random items from each category
{
	grocerylist[_listnum][0] = possibleitems[_category][_rand];
	grocerylist[_listnum][1] = false;
	_listnum += 1;
	if _listnum mod 2 == 0 //odd numbers, next category
	{
		_category += 1;
		_rand = irandom_range(0,3);
	}
	else //even numbers, shuffle the last item on the list into the empty spot, try again
	{
		 possibleitems[_category][_rand] = possibleitems[_category][3];
		_rand = irandom_range(0,2);
	}
}

draw_set_font(fnt_temp);


checkedout = false;


// leave only the main layer active
//instance_deactivate_layer("TrickLayer1A");