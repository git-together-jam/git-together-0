/// @description Insert description here
// You can write your code in this editor
//draw_text(0, 0, "vel:  " + string(xvel) + ", " + string(yvel));
//draw_text(0, string_height("1"), string(y));

draw_self();

if (laser_length > 0)
{
	draw_sprite_ext(spr_eld_laser, current_time % 3, x,y, laser_length, 1.0, image_angle+90, c_white, 1.0);
}
//draw_set_color(c_red);
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
//draw_set_color(c_white);


draw_set_color(c_aqua);
draw_rectangle(10, 10, 10 + 50 * fuel_level * 0.01, 20, false);
draw_set_color(c_white);

//draw_text(0,30, "num enemies: " + string(instance_number(obj_eld_enemy1)));