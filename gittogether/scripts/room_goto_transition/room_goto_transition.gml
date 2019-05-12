/// @func room_goto_transition(target_room, type, col*, title_text*, title_font*, title_col*)
/// @param target_room
/// @param type
/// @param col*
/// @param title_text*
/// @param title_font*
/// @param title_col*

enum TransType {
	screenFade, checkerboard, circle,
	
	rand, none
}

if (instance_exists(obj_Transition)) return -1;

var _t = instance_create_depth(0, 0, -100000, obj_Transition);
with (_t) {
	targetRoom = argument[0];
	
	type  = argument[1];
	if (type == TransType.rand) type = irandom(TransType.rand-1);
	color = (argument_count > 2) ? argument[2] : c_black;
	
	if (argument_count > 3) {
		drawTitle = true;
		titleText = (argument_count > 3) ? argument[3] : "";
		titleFont = (argument_count > 4) ? argument[4] : fnt_big;
		titleCol  = (argument_count > 5) ? argument[5] : c_black;
	}
	
	event_user(0);		// Update transition with the selected type
}