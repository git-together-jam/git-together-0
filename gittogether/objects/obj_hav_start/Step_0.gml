



if obj_hav_system.game_state == hGameState.Play {
	
	alpha -= 0.05;
	
	if alpha <= 0 {
		instance_destroy();	
	}
	
}