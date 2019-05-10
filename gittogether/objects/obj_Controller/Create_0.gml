/// @description Persistent background controller

randomize();

// Minigame vars
miniTitleAlpha = 0;
miniType = -1;

exitTime = .5*room_speed;
exitTimer = exitTime;

// Globals
global.Coins = 0;
global.Tickets = 0;

//Controller Support
global.Controller = gamepad_get_first(0);