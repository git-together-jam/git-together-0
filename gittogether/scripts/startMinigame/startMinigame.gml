/// @arg room
/// @arg type
/// @desc (TBD) This function will start fading to the minigame room

// Args
var rm = argument[0];
var type = argument[1];

// Start
room_goto(rm);

// Set data
oController.miniType = type;
oController.miniTitleAlpha = 2;