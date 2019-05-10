/// @description 
// Movement
hsp = global.iMoveX * moveSpeed;
vsp = global.iMoveY * moveSpeed;

// Check for collisions and move one pixel at a time.
// Horizontal:
repeat(abs(hsp)) {
	
	if instance_place(x+sign(hsp), y, obj_ArcadeParent) break;
	x+=sign(hsp);
}
// Vertical:
repeat(abs(vsp)) {
	
	if instance_place(x, y+sign(vsp), obj_ArcadeParent) break;
	y+=sign(vsp);
}

// Play with arcade machine
arcade = instance_place(x, y-4, obj_ArcadeParent);

if (global.iSelect && arcade) {
	// Get room
	var _rm = global.arcRoom[arcade.type];
	
	startMinigame(_rm, arcade.type);
}