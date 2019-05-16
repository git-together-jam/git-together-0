/// @description Insert description here
// You can write your code in this editor

if (room == rm_Overworld) exit;

application_surface_draw_enable(!shaderEnabled);

#region Game shader effect

// Drawing the app surface
gpu_set_tex_filter(shaderEnabled);

if (shaderEnabled) {
	if (shaderSet != -1) {
		shader_set(shaderSet);
		draw_surface_ext(application_surface,0,0,1/RES_S,1/RES_S,0,-1,1);
		shader_reset();
	
	}
}

gpu_set_tex_filter(false);

#endregion