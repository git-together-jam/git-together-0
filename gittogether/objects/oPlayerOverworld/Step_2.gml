/// @description 
// Play with arcade machine
arcade = instance_place(x, y, oArcadeParent);

if (global.iSelect && arcade) {
	// Get room
	var rm = global.arcRoom[arcade.type];
	
	startMinigame(rm, arcade.type);
}