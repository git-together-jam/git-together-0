if global.iSelect{
	if (global.elduser != "") end_minigame(obj_eld_controller.game_won);
	else room_goto_transition(rm_eld,TransType.screenFade);
}