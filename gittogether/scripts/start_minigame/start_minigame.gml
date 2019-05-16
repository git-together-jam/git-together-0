/// @func start_minigame(room,name,trans,trans_col,title_font,title_col)
/// @desc This function will start fading to the minigame room
/// @arg room
/// @arg name
/// @arg trans
/// @arg trans_col
/// @arg title_font
/// @arg title_col

// Args
var rm		  = argument[0];
var text	  = "Minigame\n\n" + argument[1];
var trans	  = argument[2];
var transCol  = argument[3];
var titleFont = argument[4];
var titleCol  = argument[5];

//instance_destroy(obj_Transition);

// Start
room_goto_transition(rm, trans, transCol,
					 text, titleFont, titleCol);