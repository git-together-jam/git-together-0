/// @description 
// Movement
hsp = global.iMoveX * moveSpeed;
vsp = global.iMoveY * moveSpeed;

// Check for collisions and move one pixel at a time.
// Horizontal:
repeat(abs(hsp)) {
	
	if instance_place(x+sign(hsp), y, obj_ArcadeMachine) break;
	x+=sign(hsp);
}
// Vertical:
repeat(abs(vsp)) {
	
	if instance_place(x, y+sign(vsp), obj_ArcadeMachine) break;
	y+=sign(vsp);
}

// Play with arcade machine
arcade = instance_place(x, y-4, obj_ArcadeMachine);

if (global.iSelect && arcade) {
	// Get room
	var _rm = global.GameRoom[arcade.type];
	start_minigame(_rm, arcade.type, arcade.trans, arcade.transColor);
}