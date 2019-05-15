/// @description Insert description here
// You can write your code in this editor
///@desc draw lightning for the scene

var vx = camera_get_view_x(view_camera[0])-floor(camera_get_view_x(view_camera[0]));
var vy = camera_get_view_y(view_camera[0])-floor(camera_get_view_y(view_camera[0]));
var dx = (vx * (APPLICATION_SURFACE_WIDTH/surface_get_width(surf_lights))) - (APPLICATION_SURFACE_WIDTH/surface_get_width(surf_lights));
var dy = (vy * (APPLICATION_SURFACE_HEIGHT/surface_get_height(surf_lights))) - (APPLICATION_SURFACE_HEIGHT/surface_get_height(surf_lights));
shader_set(shader);
	shader_set_uniform_f_array(u_col, color);
	shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt);
	shader_set_uniform_f(u_lights_offset,0,0);
	texture_set_stage(u_s_lights, tex_lights);
	if surface_exists(application_surface) draw_surface_ext(application_surface, 0, 0, 1., 1., 0, c_white, 1);
		// IF the scale of the game is ever changed these '1.' need to be changed as well
shader_reset();

/*
	if anything goes wrong this is okay-ish for debugging
	show_debug_message(string_concat(
		"---------------------- // TEXEL WIDTH // ------------------------\n\n",
		application_texel_width * 10000, "/ 10000\n == ? \n",
		(1/surface_get_width(application_surface)) * 10000,
		"\n-----------------------------------------------------------------------")
	);
	show_debug_message(string_concat(
		"---------------------- // TEXEL HEIGHT // ------------------------\n\n",
		application_texel_height * 10000, "/ 10000\n == ? \n",
		(1/surface_get_height(application_surface)) * 10000,
		"\n-----------------------------------------------------------------------")
	);
		show_debug_message(string_concat(
		"---------------------- // DIFFERENCES // ------------------------\n\n",
		"DX: ", dx, "\n","DY: ", dy,
		"\n-----------------------------------------------------------------------")
	);
	
*/

