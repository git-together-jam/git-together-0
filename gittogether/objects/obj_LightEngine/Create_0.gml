/// @description Insert description here
// You can write your code in this editor

#region shader data
application_texture = surface_get_texture(application_surface);
application_texel_width = texture_get_texel_width(application_texture);
application_texel_height = texture_get_texel_height(application_texture);

shader = shd_lights;
u_col	= shader_get_uniform(shader, "col");
u_con_sat_brt	= shader_get_uniform(shader, "con_sat_brt");
u_lights_offset = shader_get_uniform(shader, "u_vOffsetFix");
u_s_lights = shader_get_sampler_index(shader, "lights");
surf_lights = -1;
tex_lights = -1;

con_sat_brt = [];
color = [];
#endregion

#region scene data
//							R			G			B			CON		SAT		BRT		POPS	POPT
lights_set_scene(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	//12h
#endregion
