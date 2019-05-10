/// @func room_goto_transition(target_room, type, color*)
/// @param target_room
/// @param type
/// @param color*

enum TransType {
	screenFade, checkerboard, circle,
	
	rand
}

if (instance_exists(obj_Transition)) return -1;

var _t = instance_create_depth(0, 0, -100000, obj_Transition);
with (_t) {
	targetRoom = argument[0];
	
	type  = argument[1];
	if (type == TransType.rand) type = irandom(TransType.rand-1);
	
	color = (argument_count > 2) ? argument[2] : c_black;
	
	event_user(0);		// Update transition with the selected type
}