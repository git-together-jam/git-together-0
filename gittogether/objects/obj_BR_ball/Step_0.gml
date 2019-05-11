// States
switch(state) {
	case BR_States.idle:
		#region Idle State
		
		// Move with paddle
		x = obj_BR_paddle.x;
		
		// Shooting the ball
		if (keyboard_check(vk_space)) {
			state = BR_States.moving;
			dir = random_range(60, 120);
			spd = moveSpeed;
		}
		#endregion
		break;
	case BR_States.moving:
		#region Moving State
		var _hsp = lengthdir_x(spd, dir);
		var _vsp = lengthdir_y(spd, dir);
		
		if (place_meeting(x + _hsp, y + _vsp, obj_BR_brick)) {
			dir = collision_normal(x, y, obj_BR_brick, 10, 4);
			_hsp = lengthdir_x(spd, dir);
			_vsp = lengthdir_y(spd, dir);
		} else if (place_meeting(x + _hsp, y +_vsp, obj_BR_paddle)) {
			dir = point_direction(obj_BR_paddle.x, obj_BR_paddle.y, x, y);
			_hsp = lengthdir_x(spd, dir);
			_vsp = lengthdir_y(spd, dir);
		}
		
		if (bbox_left < 0 || bbox_right > room_width) {
			_hsp = -_hsp;
		}
		
		if (bbox_top < 0) {
			_vsp = -_vsp;
		}
		
		x += _hsp;
		y += _vsp;
		
		dir = point_direction(0, 0, _hsp, _vsp);
		#endregion
		break;
}