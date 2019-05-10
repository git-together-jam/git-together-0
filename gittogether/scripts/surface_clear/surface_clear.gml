/// @func surface_clear(surf, width, height, color, alpha)
/// @arg surf
/// @arg width
/// @arg height
/// @arg color
/// @arg alpha

gml_pragma("forceinline");

var _surf = argument[0];

if (!surface_exists(_surf)) _surf = surface_create(argument[1], argument[2]);
if (surface_get_width(_surf)  != argument[1] ||
	surface_get_height(_surf) != argument[2]) 
		surface_resize(_surf, argument[1], argument[2]);
surface_set_target(_surf);
draw_clear_alpha(argument_count > 3 ? argument[3] : c_white, 
				 argument_count > 4 ? argument[4] : argument_count > 3);
surface_reset_target();

return _surf;