/// @description Insert description here
// You can write your code in this editor

speed = 0;
var _s = ds_list_size(targets);
if (_s > 0)
{
	var _t = targets[| 0];
	var _tx = _t[0];
	var _ty = _t[1];
	
	if (point_distance(x,y, _tx, _ty) < 2)
	{
		ds_list_delete(targets, 0);
		if (_s - 1 == 0)
			image_angle = 0; // at end of journey, zero out the angle
	}
	else
	{
		var _tar_angle = point_direction(x,y, _tx, _ty);
		direction = lerp(direction, _tar_angle, 0.1);
		image_angle = direction-90;
		speed = 1;
	}
}
