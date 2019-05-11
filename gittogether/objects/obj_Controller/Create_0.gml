/// @description Persistent background controller

randomize();

// Minigame vars
miniTitleAlpha = 0;
miniType = -1;

exitTime = .5*room_speed;
exitTimer = exitTime;

// Globals
global.Coins = sys_save_global_read("Coins",100);
global.Tickets = sys_save_global_read("Tickets",0);
global.CheatsUsed = sys_save_global_read("CheatsUsed",0);
show_debug_message(sys_save_global_read("Version",0));
sys_save_disk_write();

//Controller Support
global.Controller = gamepad_get_first(0);

// For Drawing the GUI
guiXOffset = 8;
guiYOffset = RES_H-16;