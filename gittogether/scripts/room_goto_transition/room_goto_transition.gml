/// @func room_goto_transition(type, target_room, color*)
/// @param type
/// @param target_room
/// @param color*

enum TransType {
	checkboard, screenFade
}

var _t = instance_create_depth(0, 0, -100000, obj_transition);

with (_t) {
	type = argument[0];
	targetRoom = argument[1];
	color = (argument_count > 2) ? argument[2] : c_black;
	event_user(0);
}