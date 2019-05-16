/// @func start_minigame(room,name,trans,trans_col,title_font,title_col)
/// @desc This function will start fading to the minigame room
/// @arg room
/// @arg name
/// @arg trans
/// @arg trans_col
/// @arg title_font
/// @arg title_col

global.GamePlaying = argument[0];

// Args
var rm		  = argument[1];
var text	  = "Minigame\n\n" + argument[2];
var trans	  = argument[3];
var transCol  = argument[4];
var titleFont = argument[5];
var titleCol  = argument[6];

// Start
room_goto_transition(rm, trans, transCol,
					 text, titleFont, titleCol);