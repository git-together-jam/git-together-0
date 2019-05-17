/// @desc 

var _i = 0;
repeat (life) {
	draw_sprite_ext(spr_as_Player,0,16+(sprite_get_width(spr_as_Player)/2+2)*_i, 16,
	.5, .5, image_angle, image_blend, image_alpha);
	++_i;
}