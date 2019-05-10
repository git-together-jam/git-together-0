/// @func draw_rect_outline(x1, y1, x2, y2, [color, alpha])
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg [color
/// @arg alpha]

gml_pragma("forceinline");

var _x1 = argument[0];
var _y1 = argument[1];

draw_sprite_ext(spr_pixel, 0, _x1, _y1, 
				argument[2] - _x1, argument[3] - _y1,  0, 
				argument_count > 4 ? argument[4] : c_white, 
				argument_count > 5 ? argument[5] : 1);