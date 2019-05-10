/// @description 
// Rotation
rot += random_range(-3, 3);

// Outside room
if (x < margin || x > room_width-margin || y < margin || y>room_height-margin) {
	direction += 5;
}
// Inside room
else {
	direction += rot;
}

// Click
if (hover() && global.iMouseL_P) {
	instance_destroy();
	oB1_Controller.myScore++;
}