/// @description 
// Camera follows player
if (instance_exists(oPlayerOverworld)) {
	var _x = oPlayerOverworld.x - RES_W/2;
	var _y = oPlayerOverworld.y - RES_H/2;
	
	camera_set_view_pos(view_camera[0], _x, _y);
}