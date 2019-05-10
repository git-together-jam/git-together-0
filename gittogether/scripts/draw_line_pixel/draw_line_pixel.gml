/// @func draw_line_pixel(x1, y1, x2, y2, [color, alpha])
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg [color
/// @arg alpha]

var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[2];
var _y2 = argument[3];
var _col = argument_count > 4 ? argument[4] : c_white;
var _alp = argument_count > 5 ? argument[5] : 1;

var _dis = point_distance( _x1, _y1, _x2, _y2);
var _dir = point_direction(_x1, _y1, _x2, _y2);

draw_sprite_ext(spr_pixel, 0, _x1, _y1, _dis, 1, _dir, _col, _alp);