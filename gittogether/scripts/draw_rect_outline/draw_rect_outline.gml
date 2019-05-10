/// @func draw_rect_outline(x1, y1, x2, y2, [color, alpha])
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
var _color = argument_count > 4 ? argument[4] : c_white;
var _alpha = argument_count > 5 ? argument[5] : 1;

draw_line_pixel(_x1, _y1 - 1, _x2, _y1 - 1, _color, _alpha);
draw_line_pixel(_x1, _y2, _x2, _y2,			_color, _alpha);
draw_line_pixel(_x1, _y1, _x1, _y2,			_color, _alpha);
draw_line_pixel(_x2 + 1, _y1, _x2 + 1, _y2, _color, _alpha);