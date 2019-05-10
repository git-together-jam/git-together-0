/// @func surface_clear_set(surf, width, height, color, alpha)
/// @arg surf
/// @arg width
/// @arg height
/// @arg color
/// @arg alpha

gml_pragma("forceinline");

var _surf = argument0;

if (!surface_exists(_surf)) _surf = surface_create(argument1, argument2);
if (surface_get_width(_surf)  != argument1 || surface_get_height(_surf) != argument2) {
	surface_resize(_surf, argument1, argument2);
}
surface_set_target(_surf);
draw_clear_alpha(argument3, argument4);

return _surf;