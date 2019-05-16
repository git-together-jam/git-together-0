

if keyboard_check_pressed( vk_right) {
	new_direction = hDirection.Right;
}
if keyboard_check_pressed( vk_up) {
	new_direction = hDirection.Up;
}
if keyboard_check_pressed( vk_left) {
	new_direction = hDirection.Left;
}
if keyboard_check_pressed( vk_down) {
	new_direction = hDirection.Down;
}
	


if alarm[8] == -1 {
	
	ds_list_add( DIR_LIST, new_direction);
	
		var _num_blocks = ds_list_size( SNAKE_LIST);
			for( var i = 0; i < _num_blocks; i++){				
				
				with( SNAKE_LIST[| i]){
					
					if hold == false  {
						
						switch DIR_LIST[| ds_list_size( DIR_LIST) - ( my_pos + 1)] {
							case 0:	new_x += hGRID_CELL_S; break;
							case 1:	new_y -= hGRID_CELL_S; break;
							case 2:	new_x -= hGRID_CELL_S; break;
							case 3:	new_y += hGRID_CELL_S; break;
						}
						old_x = x;
						old_y = y;
						
					} else {
						
						hold = false;	
						
					}
				
				}
				
		}	
		
		alarm[8] = TURN_TIME;
		
}			



if instance_number( obj_hav_duck) <= 0 {
	
	var _x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom( 19)) - 1;
	var _y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom( 16)) - 1;
	
	while( position_meeting( _x, _y, obj_hav_snake) == true) {
		_x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 0, 19 )) - 1;
		_y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 0, 16)) - 1;		
	}
	
	instance_create_layer( _x, _y, "duck", obj_hav_duck);	
	
}