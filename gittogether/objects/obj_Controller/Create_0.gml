/// @description Persistent background controller

randomize();

application_surface_draw_enable(false);

// Shader
shaderEnabled = true;
shaderSet = -1;

// Arcade machine vars
miniTitleAlpha = 0;
machinesPlaced = false;

// Exiting a minigame
exitTime = 1*room_speed;
exitTimer = exitTime;
exitTimerDisplayAlpha = 0;
exitTimerMaxTime = exitTime;

// Globals
global.Coins = sys_save_global_read("Coins", 100);
global.Tickets = sys_save_global_read("Tickets", 0);
//global.CheatsUsed = sys_save_global_read("CheatsUsed",0);
global.Overworldx = 320;
global.Overworldy = 176;

// Controller Support
global.Controller = gamepad_get_first(0);

// Showcase stuff
global.GamePlaying = noone;
global.GamesWon = sys_save_global_read("Games Won", 0);

// For Drawing the GUI
guiXOffset = 8;
guiYOffset = RES_H-16;