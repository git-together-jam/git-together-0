/// @description Persistent background controller

randomize();

// Minigame vars
miniTitleAlpha = 0;
miniName = "";
maxMachinesPerRow = 8;

exitTime = .5*room_speed;
exitTimer = exitTime;

// Globals
global.Coins = sys_save_global_read("Coins",100);
global.Tickets = sys_save_global_read("Tickets",0);
//global.CheatsUsed = sys_save_global_read("CheatsUsed",0);

//Controller Support
global.Controller = gamepad_get_first(0);

// For Drawing the GUI
guiXOffset = 8;
guiYOffset = RES_H-16;