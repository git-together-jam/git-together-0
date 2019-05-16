/// @description 
// Rotation
rot += random_range(-3, 3);

// Outside room
if (!stillEntering && (x < margin || x > room_width-margin || y < margin || y>room_height-margin)) {
	direction += 3;
}
// Inside room
else {
	if (!stillEntering) direction += rot/10;
	
	// Entered
	if (stillEntering && (x > margin && x < room_width-margin && y > margin && y < room_height-margin)) {
		stillEntering = false;
	}
}

// Click
if (hover() && global.iMouse_LP) {
	instance_destroy();
	with (obj_B1_Controller) {
		target--;
		if (target <= 0) end_minigame(true);
	}
}