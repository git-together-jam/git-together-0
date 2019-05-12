/// @func start_minigame(room, name, trans, trans_col*)
/// @desc This function will start fading to the minigame room
/// @arg room
/// @arg name
/// @arg trans
/// @arg trans_col

// Args
var rm = argument[0];
var name = argument[1];
var trans = argument[2];
var transCol = argument[3];

instance_destroy(obj_Transition);

// Start
room_goto_transition(rm,trans,transCol);

/*/ Set data
obj_Controller.miniName = name;
obj_Controller.miniTitleAlpha = 2;