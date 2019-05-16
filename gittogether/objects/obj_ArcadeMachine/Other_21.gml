/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var vx = floor(camera_get_view_x(view_camera[0]));
var vy = floor(camera_get_view_y(view_camera[0]));
draw_sprite_ext(spr_arcadeLights, image_index, x -vx , y - 4 -vy, image_xscale + (cos(current_time/1000)/2), image_yscale, image_angle, image_blend, 0.7);