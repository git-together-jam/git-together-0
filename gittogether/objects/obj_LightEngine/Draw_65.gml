/// @description Insert description here
// You can write your code in this editor
surface_free(surf_lights);
surf_lights = surface_create(RES_W, RES_H);
tex_lights = surface_get_texture(surf_lights);
application_texture = surface_get_texture(application_surface);
application_texel_width = texture_get_texel_width(application_texture);
application_texel_height = texture_get_texel_height(application_texture);