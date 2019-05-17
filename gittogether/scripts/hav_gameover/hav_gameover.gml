



if obj_hav_system.game_state == hGameState.Play {
	
	ds_list_clear( SNAKE_LIST);
	ds_list_clear( DIR_LIST);
	with( obj_hav_system){	
		game_state = hGameState.Over;		
	}
	with( obj_hav_snake){
		instance_destroy();	
	}
	instance_create_layer( 0, 0, "particles", obj_hav_end);
	
}