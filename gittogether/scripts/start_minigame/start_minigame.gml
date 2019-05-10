/// @func start_minigame(room, type, trans, trans_col*)
/// @desc This function will start fading to the minigame room
/// @arg room
/// @arg type
/// @arg trans
/// @arg trans_col

// Args
var rm = argument[0];
var type = argument[1];
var trans = argument[2];
var transCol = argument[3];

// Start
room_goto_transition(rm,trans,transCol);

// Set data
obj_Controller.miniType = type;
obj_Controller.miniTitleAlpha = 2;