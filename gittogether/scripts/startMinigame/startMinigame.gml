/// @arg room
/// @arg type
/// @desc (TBD) This function will start fading to the minigame room

// Args
var rm = argument[0];
var type = argument[1];

// Start
room_goto_transition(rm,TransType.circle);

// Set data
obj_Controller.miniType = type;
obj_Controller.miniTitleAlpha = 2;