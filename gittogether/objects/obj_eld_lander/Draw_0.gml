/// @description Insert description here
// You can write your code in this editor
draw_text(0, 0, "vel:  " + string(xvel) + ", " + string(yvel));
draw_text(0, string_height("1"), string(y));

draw_self();

draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
draw_set_color(c_white);