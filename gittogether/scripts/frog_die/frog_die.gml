if (moveTimer <= 2){
	room_goto_transition(room,TransType.checkerboard,c_black);
	if (control)audio_play_sound(snd_frog_lose,100,false);
	control = false;
	alarm[0] = .1*room_speed;
}