/// @func room_goto_transition(target_room, type, color*)
/// @param type
/// @param target_room
/// @param color*

enum TransType {
	screenFade, checkerboard
}

var _t = instance_create_depth(0, 0, -100000, obj_Transition);

with (_t) {
	targetRoom = argument[0];
	
	type  = argument[1];
	color = (argument_count > 2) ? argument[2] : c_black;
	
	event_user(0);		// Update transition with the selected type
}