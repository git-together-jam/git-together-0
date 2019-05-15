/// @description Insert description here
// You can write your code in this editor

speed = 0;

switch(state)
{
	case ELDEnemyState.Tracking:
		//var _s = ds_list_size(targets);
		var _s = array_length_1d(targets);
		//if (_s > 0)
		var _t = -1, _tx, _ty;
		if (trackIndex < _s) // using Track
		{
			//var _t = targets[| 0];
			_t = targets[trackIndex];
			_tx = _t[0];
			_ty = _t[1];
		}
		else // headed towards formation position
		{
			_tx = (posIndex mod 10) * 10.0 + obj_eld_controller.origin_x;
			_ty = (posIndex div 10) * 10.0 + obj_eld_controller.origin_y;			
		}
		
		if (point_distance(x,y, _tx, _ty) < 2)
		{
			if (_t != -1) // still using the track
			{
				//ds_list_delete(targets, 0);
				trackIndex += 1;
				//if (_s - 1 == 0)
				//if (trackIndex >= _s)
				//{
				//	state = ELDEnemyState.Formation;
				//	image_angle = 0; // at end of journey, zero out the angle
				//}
			}
			else // arrived at our formation position
			{
				state = ELDEnemyState.Formation;
				image_angle = 0;
			}
		}
		else
		{
			var _dx = lengthdir_x(1.0, direction);
			var _dy = lengthdir_y(1.0, direction);
			
			_dx = lerp(_dx, _tx-x, 0.025);
			_dy = lerp(_dy, _ty-y, 0.025);
			direction = point_direction(0,0, _dx, _dy);
			//var _tar_angle = point_direction(x,y, _tx, _ty);
			//direction = _tar_angle;
			//direction = lerp(direction, _tar_angle, 0.5);
			image_angle = direction-90;
			speed = 1;
		}
		
	break;
	
	case ELDEnemyState.Formation:
		x = (posIndex mod 10) * 10.0 + obj_eld_controller.origin_x;
		y = (posIndex div 10) * 10.0 + obj_eld_controller.origin_y;
	break;
}

