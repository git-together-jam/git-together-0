/// @description 
// Create camera
view_enabled = true;
view_visible[0] = true;

var cam = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, cam);

// Minigame
if (room != rmOverworld) {
	
}