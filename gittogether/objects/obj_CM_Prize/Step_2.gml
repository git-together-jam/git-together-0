/// @description Clamp it

if bbox_top > room_height {
	instance_destroy();	
}
//x = clamp(x,sprite_get_bbox_left(sprite_index),room_width-sprite_get_bbox_right(sprite_index));
//y = clamp(y,sprite_get_bbox_top(sprite_index),room_height-sprite_get_bbox_bottom(sprite_index));