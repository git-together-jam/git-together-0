/// @description Insert description here
// You can write your code in this editor
#region debug light surface
if (!surface_exists(surf_lights)) {
	surf_lights = surface_create(RES_W, RES_H);
	tex_lights = surface_get_texture(surf_lights);
}
#endregion

#region draw lights
surface_set_target(surf_lights);
	draw_clear(c_black);
	gpu_set_blendmode(bm_add);
	gpu_set_tex_filter(true);
	
	// draw light sprite
	with(all){
		event_user(genericEvents.lighting);
	}
	
	
	draw_set_color(c_white);
	gpu_set_tex_filter(false);
	gpu_set_blendmode(bm_normal);
surface_reset_target();
#endregion