/// @description Insert description here
// You can write your code in this editor



if other.my_pos == 0 {
	
	var _last = SNAKE_LIST[| ds_list_size( SNAKE_LIST) - 1];
	var _x = _last.old_x;
	var _y = _last.old_y;
	
	with( instance_create_layer( _x, _y, "snake", obj_hav_snake)){	
	}	
	
	with( obj_hav_system){
		my_score++;
		turn_time_change += 0.35;
		TURN_TIME = max( 4.5, room_speed / (turn_time_base + turn_time_change) );	
	}

	instance_destroy();
	
	var _size = 2;
	//var _dir = 270 + irandom( -30, 30);
	//part_type_shape(PSYSTEM_PULSE, choose( pt_shape_line));
	//part_type_direction(PSYSTEM_PULSE, 240, 300, 0, 15);
	part_emitter_region( PSYSTEM, PSYSTEM_EMITTER_1, x - _size, x + _size, y - _size, y + _size, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst( PSYSTEM, PSYSTEM_EMITTER_1, PSYSTEM_PULSE, 20);	
	
}

