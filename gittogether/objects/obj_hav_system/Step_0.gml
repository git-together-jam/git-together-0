

if alarm[ 9] == -1 && keyboard_check_pressed( vk_anykey) && keyboard_check_pressed( vk_escape) == false {
	
	switch game_state {
		case hGameState.Start: { 
			game_state = hGameState.Play;			
			alarm[ 9] = room_speed / 2;
		} break;
		case hGameState.Over: {
			game_state = hGameState.Start;
			instance_destroy( obj_hav_end);
			instance_create_layer( 0, 0, "particles", obj_hav_start);			
			hav_newgame();
			alarm[ 9] = room_speed / 2;
		} break;	
	}

}

if ended == false && game_state == hGameState.Win && keyboard_check_pressed( vk_escape){
	end_minigame(true);	
	ended = true;
}

if game_state == hGameState.Play {
	if	( 
		keyboard_check(ord("D")) ||
		keyboard_check(vk_right) ||
		gamepad_axis_value(global.Controller,gp_axislh) > CONTROLLER_DEADZONE
		) {
		if cur_direction != hDirection.Left {
			new_direction = hDirection.Right;
		}
	}
	if	(
		keyboard_check(ord("W")) || 
		keyboard_check(vk_up) ||
		gamepad_axis_value(global.Controller,gp_axislv) < -CONTROLLER_DEADZONE
		) {
		if cur_direction != hDirection.Down {
			new_direction = hDirection.Up;
		}
	}
	if	(
		keyboard_check(ord("A")) || 
		keyboard_check(vk_left) ||
		gamepad_axis_value(global.Controller,gp_axislh) < -CONTROLLER_DEADZONE
		) {
		if cur_direction != hDirection.Right {
			new_direction = hDirection.Left;
		}
	}
	if	(
		keyboard_check(ord("S")) ||
		keyboard_check(vk_down) ||
		gamepad_axis_value(global.Controller,gp_axislv) > CONTROLLER_DEADZONE
		) {
		if cur_direction != hDirection.Up {
			new_direction = hDirection.Down;
		}
	}
}


if alarm[8] == -1 && game_state = hGameState.Play {
	
	ds_list_add( DIR_LIST, new_direction);
	cur_direction = new_direction;
	
		var _num_blocks = ds_list_size( SNAKE_LIST);
		for( var i = 0; i < _num_blocks; i++){				
				
			with( SNAKE_LIST[| i]){					
				switch DIR_LIST[| ds_list_size( DIR_LIST) - ( my_pos + 1)] {
					case 0:	new_x += hGRID_CELL_S; break;
					case 1:	new_y -= hGRID_CELL_S; break;
					case 2:	new_x -= hGRID_CELL_S; break;
					case 3:	new_y += hGRID_CELL_S; break;
				}
				old_x = x;
				old_y = y;						
			}
		}	
		alarm[8] = TURN_TIME;
		
}			



if game_state == hGameState.Play && instance_number( obj_hav_duck) <= 0 {
	
	var _x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom( 19)) - 1;
	var _y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom( 16)) - 1;
	
	while( position_meeting( _x, _y, obj_hav_snake) == true) {
		_x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 0, 19 )) - 1;
		_y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 0, 16)) - 1;		
	}
	
	instance_create_layer( _x, _y, "duck", obj_hav_duck);	
	
}


if my_score >= TARGET {
	hav_win();	
}