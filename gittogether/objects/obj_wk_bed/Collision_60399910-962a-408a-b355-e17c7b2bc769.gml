if x > 0 {
	if room = rm_wk_game{
		room_goto(rm_wk_game2)
}
	if room = rm_wk_game2{
		obj_wk_viking.wk_life = 1000
		audio_stop_all();
		obj_wk_viking.y = 5000
		audio_play_sound(snd_wk_win, 10, false)
		instance_create_depth(0, 0, 0, obj_wk_endgame)
	}
}