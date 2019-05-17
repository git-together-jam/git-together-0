/// @description Insert description here
// You can write your code in this editor

if (room == rm_Overworld) {
	instance_destroy(id);
	show_debug_message("poof im gone")
}

switch(gameState)
{
	case ELDGameState.Galaga:
		eld_game_state_galaga(false);
	break;
	
	case ELDGameState.MissileCommand:
		// RIP
	break;
	
	case ELDGameState.Standby:
		if (room == rm_eld)
			gameState = ELDGameState.Menu;
	break;
	
	case ELDGameState.Menu:
		eld_game_state_galaga(true);
		
		var anyMove = abs(global.iMoveX) or abs(global.iMoveY);
		
		--buttonSwapCooldown;
		if (anyMove and buttonSwapCooldown < 0)
		{
			buttonSwapCooldown = room_speed div 4;
			if (buttonState == ELDMenuButtons.Play)
				buttonState = ELDMenuButtons.Leaderboards;
			else
				buttonState = ELDMenuButtons.Play;
		}
		
		// if they let go, reset press timer
		if (!anyMove) buttonSwapCooldown = -1;
		
		if (global.iSelect)
		{
			if (buttonState == ELDMenuButtons.Play)
			{
				// Reset state of game from attract state
				waveState = ELDWaveState.Spawning;
				gameState = ELDGameState.Galaga
				instance_create_layer(room_width div 2, room_height - 35, "Player", obj_eld_lander);
			
				start_time = current_time * 0.001;
				curr_wave = 0;
				curr_subwave = 0;
				fuelpads_in_wave = 1;
				next_departure = current_time * 0.001 + 2.0;
			
				ds_list_clear(waves_in_progress);
			
				with(obj_eld_fuel_station) instance_destroy();
				with(obj_eld_enemy1) instance_destroy();
			
				instance_create_layer(room_width div 2, room_height + 20, "Instances", obj_eld_fuel_station);
			}
			else // enter leaderboards
			{
				gameState = ELDGameState.Standby;
				room_goto(rm_eld_highscore);
			}
		}			
	break;
}

//sorry this is so messy lol - Andy
if (room == rm_eld_user) {
	game_over = false;
	alarm[1] = -1;
	show_debug_message(string(alarm[1]));
}

if (game_over and alarm[1] < 0) alarm[1] = room_speed * 5.0;
if (game_over and global.iSelect) alarm[1] = 1;