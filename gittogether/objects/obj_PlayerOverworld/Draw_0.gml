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
	
	// Arcade game name
	var _cam_x = camera_get_view_x(view_camera[0]),
		_cam_y = camera_get_view_y(view_camera[0]),
		_cam_hw = camera_get_view_width(view_camera[0]) div 2;
	draw_rect(
		_cam_x + _cam_hw - 64,
		0,
		_cam_x + _cam_hw + 64,
		_cam_y + min(20,arcadeSelectTime) + 10,
		c_black,
	);
	var _font = draw_get_font();
	draw_set_font(fnt_normal);
	draw_text_center(
		_cam_x + _cam_hw,
		_cam_y + min(20,arcadeSelectTime),
		arcade.name,
		1,
		1,
		0,
		c_white,
		1,
	);
	draw_set_font(_font);
}