

if snake_seg == 0 {

	var _x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 5, 15));
	var _y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 5, 12));

	with( instance_create_layer( _x, _y, "snake", obj_hav_snake)){
		my_id = other.snake_seg;
		ds_list_add( hSNAKE_LIST, id);
	}
	snake_seg++;
	
} else {
	
	var _prev_seg = ds_list_find_index( hSNAKE_LIST, snake_seg - 1);
	
	switch irandom(1) {
		case 0: {
			var _new_x = _prev_seg.x + choose( -hGRID_CELL_S, hGRID_CELL_S);
			var _new_y = _prev_seg.y;					
		}
		break;
		case 1: {
			var _new_y = _prev_seg.y + choose( -hGRID_CELL_S, hGRID_CELL_S);
			var _new_x = _prev_seg.x;					
		}
		break;
	}
	
	
	with( instance_create_layer( _new_x, _new_y, "snake", obj_hav_snake)){
		my_id = other.snake_seg;
		ds_list_add( hSNAKE_LIST, id);
	}
	snake_seg++;	
	
	
}