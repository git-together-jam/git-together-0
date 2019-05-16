/// @description Insert description here
// You can write your code in this editor

speed = 0;
var _spacing = ELD_ENEMY_SPACING;

switch(state)
{
	case ELDEnemyState.Tracking:
	case ELDEnemyState.Breakaway:
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
		else if (state == ELDEnemyState.Tracking) // headed towards formation position
		{
			_tx = (posIndex mod 10) * _spacing + obj_eld_controller.origin_x;
			_ty = (posIndex div 10) * _spacing + obj_eld_controller.origin_y;			
		}
		else if (state == ELDEnemyState.Breakaway) // break away
		{
			_tx = x;
			_ty = room_height * 2;
		}
		
		// reached target coords
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
			else if (state == ELDEnemyState.Tracking) // arrived at our formation position
			{
				state = ELDEnemyState.Formation;
				image_angle = 0;
			}
			else
				instance_destroy();
		}
		else
		{
			var _dx = lengthdir_x(1.0, direction);
			var _dy = lengthdir_y(1.0, direction);
			
			_dx = lerp(_dx, _tx-x, 0.3);//0.14275);
			_dy = lerp(_dy, _ty-y, 0.3);//0.14275);
			direction = point_direction(0,0, _dx, _dy);
			//var _tar_angle = point_direction(x,y, _tx, _ty);
			//direction = _tar_angle;
			//direction = lerp(direction, _tar_angle, 0.5);
			image_angle = direction-90;
			speed = 1.5;
		}		
	break;
	
	//case ELDEnemyState.Breakaway:
	//	var _s = array_length_1d(targets);

	//	var _t = -1, _tx, _ty;
	//	if (trackIndex < _s) // using Track
	//	{
	//		//var _t = targets[| 0];
	//		_t = targets[trackIndex];
	//		_tx = _t[0];
	//		_ty = _t[1];
	//	}
	//	else
	//	{
	//		instance_destroy();		
	//	}
		
	//	if (point_distance(x,y, _tx, _ty) < 2)
	//	{
	//		trackIndex += 1;
	//	}
	//	else
	//	{
	//		var _dx = lengthdir_x(1.0, direction);
	//		var _dy = lengthdir_y(1.0, direction);
			
	//		_dx = lerp(_dx, _tx-x, 0.14275);
	//		_dy = lerp(_dy, _ty-y, 0.14275);
	//		direction = point_direction(0,0, _dx, _dy);
	//		image_angle = direction-90;
	//		speed = 1.5;
	//	}
	//break;
	
	case ELDEnemyState.Formation:
		x = (posIndex mod 10) * _spacing + obj_eld_controller.origin_x;
		y = (posIndex div 10) * _spacing + obj_eld_controller.origin_y;
	break;
}

