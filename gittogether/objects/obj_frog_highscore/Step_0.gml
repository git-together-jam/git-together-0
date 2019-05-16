if global.iSelect{
	if (global.froggerUser != "") end_minigame();
	else room_goto_transition(rm_frogger,TransType.circle);
}