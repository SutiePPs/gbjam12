/// @description initiate stuffs

// unused due to no keybinding ><

/*global.abuttonbind1 = ord("Z");
global.bbuttonbind1 = ord("X");
global.startbuttonbind1 = ord("C");
global.selectbuttonbind1 = ord("V");
global.leftbuttonbind1 = vk_left;
global.rightbuttonbind1 = vk_right;
global.upbuttonbind1 = vk_up;
global.downbuttonbind1 = vk_down;

global.abuttonbind2 = ord("J");
global.bbuttonbind2 = ord("K");
global.startbuttonbind2 = ord("U");
global.selectbuttonbind2 = ord("I");
global.leftbuttonbind2 = ord("A");
global.rightbuttonbind2 = ord("D");
global.upbuttonbind2 = ord("W");
global.downbuttonbind2 = ord("S");

global.abutton = false;
global.bbutton = false;
global.startbutton = false;
global.selectbutton = false;
global.leftbutton = false;
global.rightbutton = false;
global.upbutton = false;
global.downbutton = false;*/

// okay a little keybinding in case mind is changed :3
global.abutton = ord("Z");
global.bbutton = ord("X");
global.startbutton = vk_enter;
global.selectbutton = vk_shift;
global.leftbutton = vk_left;
global.rightbutton = vk_right;
global.upbutton = vk_up;
global.downbutton = vk_down;

//set up items
global.itembread = false;
global.itemfishe = false;
global.itemmelk = false;

shader_set(sh_gb);

// go to next room when done
room = room_next(0);