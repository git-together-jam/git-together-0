/// @description
if (facing > 0) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
} else {
	draw_sprite_ext(sprite_index,image_index,x+sprite_width,y,-image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}