/// @description 
// Play with arcade machine
if (global.iSelect) {
	var arcade = instance_place(x, y, oArcadeParent);

	if (arcade) {
		// Get room
		var rm = global.arcRoom[arcade.type];
	
		startMinigame(rm, arcade.type);
	}
}