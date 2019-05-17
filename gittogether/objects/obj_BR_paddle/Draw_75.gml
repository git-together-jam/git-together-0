/// @desc 

var _i = 0;
repeat (life) {
	draw_sprite_ext(spr_BR_paddle,0,16+(sprite_get_width(spr_BR_paddle)/2+4)*_i, 16,
	.5, .5, image_angle, image_blend, image_alpha);
	++_i;
}