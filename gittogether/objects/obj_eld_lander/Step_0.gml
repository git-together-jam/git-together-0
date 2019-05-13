/// @description Insert description here
// You can write your code in this editor
var input_thrust = keyboard_check(vk_space) || gamepad_button_check(global.Controller, gp_face1);

if (false)
{
	image_angle -= global.iMoveX * ELD_ROTATE_SPEED;

	if (global.iMoveY < 0)
	{
		var real_angle = image_angle+90;
		xvel += lengthdir_x(ELD_LANDER_IMPULSE, real_angle);
		yvel += lengthdir_y(ELD_LANDER_IMPULSE, real_angle);
		sprite_index = spr_eld_lander_firing;
	}
	else
		sprite_index = spr_eld_lander;
}
else
{
	if (global.iMoveX != 0 or global.iMoveY != 0)
		image_angle = point_direction(0, 0, global.iMoveX, global.iMoveY)-90;
		
	if (input_thrust)
	{
		var real_angle = image_angle+90;
		xvel += lengthdir_x(ELD_LANDER_IMPULSE, real_angle);
		yvel += lengthdir_y(ELD_LANDER_IMPULSE, real_angle);
		sprite_index = spr_eld_lander_firing;
	}
	else
		sprite_index = spr_eld_lander;
}

yvel += ELD_GRAVITY;

var _inst = instance_place(x+xvel, round(y+yvel), obj_eld_fuel_station);
if (_inst != noone)
{
	if (abs(xvel) > 0.4 || abs(yvel) > 0.4 || image_angle != 0 || _inst.y < y)
	{
		// explode
		audio_play_sound(snd_eld_lander_explode, 0, false);
		room_restart();
	}
	else
	{
		var _yoff = round(y) - bbox_bottom;
		//y += _inst.bbox_top - bbox_bottom;
		y = _inst.bbox_top + _yoff;
		xvel = 0;
		yvel = 0;
		//y = round(y);
		//y = floor(y);
	}
}
else
{
	x += xvel;
	y += yvel;
}