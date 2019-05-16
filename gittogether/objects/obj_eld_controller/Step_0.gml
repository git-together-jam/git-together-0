/// @description Insert description here
// You can write your code in this editor


switch(gameState)
{
	case ELDGameState.Galaga:
		eld_game_state_galaga();
	break;
	
	case ELDGameState.MissileCommand:
		// RIP
	break;
}

//sorry this is so messy lol - Andy
if (room == rm_eld_user) {
	game_over = false;
	alarm[1] = -1;
	show_debug_message(string(alarm[1]))
}

if (game_over and alarm[1] < 0) alarm[1] = room_speed * 5.0;
if (game_over and global.iSelect) alarm[1] = 1;

if (room == rm_Overworld) instance_destroy(id);