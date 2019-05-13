/// @description Insert description here
// You can write your code in this editor

var _y = y;
var _bbl = bbox_left;

// give slight up/down hover without affect bounding boxes
//y += sin(current_time * 0.001) * 0.5;

draw_set_color(c_aqua);
var _right = _bbl+4 + (fuel_level*0.01*tank_width);
draw_rectangle(_bbl+4, y, _right, y+1, false);
draw_set_color(c_white);

draw_self();

y = _y;

draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
draw_set_color(c_white);
