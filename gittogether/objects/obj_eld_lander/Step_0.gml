/// @description Insert description here
// You can write your code in this editor
var input_thrust = keyboard_check(vk_space) || gamepad_button_check(global.Controller, gp_face1);
var input_firing = mouse_check_button(mb_left) || gamepad_button_check(global.Controller, gp_face2);

yvel += ELD_GRAVITY;

var on_pad = place_meeting(x,y+2, obj_eld_fuel_station);

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
	if ((global.iMoveX != 0 or global.iMoveY != 0) and !on_pad)
		image_angle = point_direction(0, 0, global.iMoveX, global.iMoveY)-90;
		
	if (input_thrust and fuel_level >= ELD_THRUST_COST)
	{
		var real_angle = image_angle+90;
		xvel += lengthdir_x(ELD_LANDER_IMPULSE, real_angle);
		yvel += lengthdir_y(ELD_LANDER_IMPULSE, real_angle);
		sprite_index = spr_eld_lander_firing;
		
		fuel_level -= ELD_THRUST_COST;
		
		if (audio_is_playing(snd_eld_lander_thrust) == false)
			audio_play_sound(snd_eld_lander_thrust, 0, true);		
	}
	else
	{
		sprite_index = spr_eld_lander;
		if (audio_is_playing(snd_eld_lander_thrust))
			audio_stop_sound(snd_eld_lander_thrust);
	}
}

var _inst = instance_place(x+xvel, y+max(1.0, abs(yvel)) * sign(yvel), obj_eld_fuel_station);
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
		y = _inst.bbox_top + _yoff - 1;
		xvel = 0;
		yvel = 0;
		
		if (fuel_level < 100 and _inst.fuel_level > 0.0)
		{
			var _take =  min(1.0, _inst.fuel_level);
			fuel_level += _take;
			_inst.fuel_level -= _take;
		}
		//y = round(y);
		//y = floor(y);
	}
}
else
{
	x += xvel;
	y += yvel;
}


////////////////////
// FIRIN' MAH LASER
////////////////////
if (global.iMouse_LP and fuel_level > ELD_LASER_COST)
{
	fuel_level -= ELD_LASER_COST;
	
	var _ang = image_angle + 90;
	with (instance_create_layer(x,y, "Instances", obj_eld_laser) )
	{
		direction = _ang;
		image_angle = _ang;
		speed = 3;
		audio_play_sound(snd_eld_laser_2, 0, false);
	}
}

//if (input_firing && fuel_level > ELD_LASER_COST)
//{
//	fuel_level -= ELD_LASER_COST;
//	laser_length = min(laser_length + 0.5, 20.0);
	
//	audio_play_sound(snd_eld_laser_0, 0, false);
//}
//else if (laser_length > 0.0)
//{
//	if (audio_is_playing(snd_eld_laser_0))
//		audio_stop_sound(snd_eld_laser_0);
//	laser_length = 0;//max(0.0, laser_length - 0.1);
//}