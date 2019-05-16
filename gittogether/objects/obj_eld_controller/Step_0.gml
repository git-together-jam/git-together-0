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

if (game_over and alarm[0] < 0) alarm[0] = room_speed * 5.0;
