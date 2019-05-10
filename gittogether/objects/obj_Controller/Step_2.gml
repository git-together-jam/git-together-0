/// @description 
// Camera follows player
if (instance_exists(obj_PlayerOverworld)) {
	var _x = obj_PlayerOverworld.x - RES_W/2;
	var _y = obj_PlayerOverworld.y - RES_H/2;
	
	camera_set_view_pos(view_camera[0], _x, _y);
}

// Overworld depth
if (room == rm_Overworld) {
	with (all) {
		if (sprite_exists(sprite_index)) {
			depth = -bbox_bottom;
		}
	}
}