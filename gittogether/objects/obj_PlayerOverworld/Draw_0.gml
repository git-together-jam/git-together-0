/// @description 
draw_self();

// Arcade play
if (arcade) {
	var _scale = max(1, dsin(arcadeSelectTime) * 1.2);
	draw_sprite_ext(
		spr_GUIPlay, 
		0, 
		x, 
		y - 24,
		_scale,
		_scale,
		0,
		image_blend,
		1,
	);
}