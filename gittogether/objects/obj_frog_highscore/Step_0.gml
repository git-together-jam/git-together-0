if global.iSelect{
	if (global.froggerUser != "") end_minigame(true);
	else room_goto_transition(rm_frogger,TransType.circle);
}