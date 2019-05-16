/// @desc ?
if bathroom_cooldown == 0 && place_meeting(x,y,obj_PlayerOverworld){
	using_the_bathroom++;
}

if using_the_bathroom > 60 {
	//play the sfx
	audio_play_sound(snd_toilet_flushing_with_gurggles, 0, false)
	using_the_bathroom = 0;
	bathroom_cooldown = bathroom_cooldown_reset;
}

if bathroom_cooldown > 0 {
	bathroom_cooldown--;
}