/// @description Persistent background controller

randomize();

// Minigame vars
miniTitleAlpha = 0;
miniType = -1;

exitTime = .5*room_speed;
exitTimer = exitTime;

// Globals
global.Coins = 100;
global.Tickets = 0;
global.CheatsUsed = 0;

//Controller Support
global.Controller = gamepad_get_first(0);

// For Drawing the GUI
guiXOffset = 8;
guiYOffset = RES_H-16;