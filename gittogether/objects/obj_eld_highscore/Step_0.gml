if global.iSelect{
	if (global.elduser != "") end_minigame(true);
	else room_goto_transition(rm_eld_menu,TransType.screenFade);
}