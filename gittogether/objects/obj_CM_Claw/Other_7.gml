/// @description Stop speed
image_speed = 0;
switch(state) {
	case CMClawState.dropped: image_index = 0; break;
	case CMClawState.grabbing: image_index = 2; break;
}