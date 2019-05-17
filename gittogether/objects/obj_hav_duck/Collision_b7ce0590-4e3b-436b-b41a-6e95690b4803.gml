



if other.my_pos == 0 {
	
	var _last = SNAKE_LIST[| ds_list_size( SNAKE_LIST) - 1];
	var _x = _last.old_x;
	var _y = _last.old_y;
	
	with( instance_create_layer( _x, _y, "snake", obj_hav_snake)){	
	}	
	
	var _notif = "";
	with( obj_hav_system){
		my_score++;
		turn_time_change += 0.35;
		TURN_TIME = max( 5.0, room_speed / (turn_time_base + turn_time_change) );
		
		if other.x > 60 && irandom(4) == 1 {
			var _size = ds_list_size( notifs);
			if _size > 0 {
				var _index = irandom( _size - 1);
				_notif = ds_list_find_value( notifs, _index);
				ds_list_delete( notifs, _index);
				
			}
		}		
		
	}
	hav_notif( _notif);

	instance_destroy();
	

	
	var _size = 2;
	part_type_color3(PSYSTEM_PULSE, c_yellow, c_yellow, c_yellow);
	part_emitter_region( PSYSTEM, PSYSTEM_EMITTER_1, x - _size, x + _size, y - _size, y + _size, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst( PSYSTEM, PSYSTEM_EMITTER_1, PSYSTEM_PULSE, 20);	
	
}

