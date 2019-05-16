/// @description Insert description here
// You can write your code in this editor
var numStars = array_length_1d(stars);
var _rh = room_height;
for (var i = 0; i < numStars; ++i)
{
	var _y = stars[i];
	if (_y >= 0)
	{
		var _brightness = sin((i + _y)*0.1 + nonces[i]) * 0.5 + 0.5; 
		draw_sprite_ext(spr_eld_star, 0, i, _y, 1, 1, 0, c_white, _brightness);
	}
	stars[i] += 2;//1.5;
	if (stars[i] > _rh)
		stars[i] = ELD_STAR_BEGIN_HEIGHT;	
}