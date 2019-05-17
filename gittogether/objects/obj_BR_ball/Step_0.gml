// Set velocity composants based on direction
hsp = lengthdir_x(spd, dir);
vsp = lengthdir_y(spd, dir);

// States
switch(state) {
	case BR_States.idle:
		#region Idle State
		
		// Move with paddle
		x = obj_BR_paddle.x;
		
		// Shooting the ball
		if (global.iSelect || global.iMouse_LP) {
			state = BR_States.moving;
			dir = irandom_range(45, 135);
			spd = moveSpeed;
		}
		#endregion
		break;
	case BR_States.moving:
		#region Moving State
		
		// Collisions and bouncing
		var _brick = instance_place(x + hsp, y + vsp, obj_BR_brick);
		if (_brick != noone) {
			dir = collision_normal(x, y, _brick, 12, 1);
			audio_play_sound(snd_ball_hit, 0, false);
			instance_destroy(_brick);
			
		} else if (place_meeting(x + hsp, y + vsp, obj_BR_paddle)) {
			audio_play_sound(snd_ball_hit, 0, false)
			if (bbox_bottom < obj_BR_paddle.bbox_top)
				dir = point_direction(obj_BR_paddle.x, obj_BR_paddle.y, x, y);
			else
				dir = collision_normal(x, y, obj_BR_paddle, 9, 1)
		}
		
		// Update velocity composants
		hsp = lengthdir_x(spd, dir);
		vsp = lengthdir_y(spd, dir);
		
		// Bounce against walls
		if (bbox_left < 0 || bbox_right > room_width) {
			hsp = -hsp;
			audio_play_sound(snd_ball_hit, 0, false)
		}
		if (bbox_top < 0) {
			vsp = -vsp;
			audio_play_sound(snd_ball_hit, 0, false)
		}
		
		if (bbox_bottom > room_height) {
			//(subtract life/points)
			
			with (obj_BR_paddle) {
				audio_play_sound(snd_death_breakout, 0, false)
				life -= 1;
				if (life <= 0) end_minigame();
			}
			
			// Stop movement
			spd = 0;
			hsp = 0;
			vsp = 0;
			
			// Reset  position and state
			x = obj_BR_paddle.x;
			y = obj_BR_paddle.bbox_top - sprite_height/2;
			state = BR_States.idle;	
		}
		
		// Move
		x += hsp;
		y += vsp;
		
		// Update direction
		dir = point_direction(0, 0, hsp, vsp);
		#endregion
		break;
}