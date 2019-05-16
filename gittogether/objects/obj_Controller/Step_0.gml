
// During transition, ignore exiting input
if (instance_exists(obj_Transition)) exit;

if (global.iExitInit || (global.iExit && (exitTimer != exitTime))) {
	exitTimer--;
	exitTimerDisplayAlpha = min(exitTimerDisplayAlpha + 0.2, 1);
	exitTimerMaxTime = exitTimer;
}
else {
	exitTimer = exitTime;
	exitTimerDisplayAlpha = max(exitTimerDisplayAlpha - 0.05, 0);
}
if (exitTimer <= 0) {
	if (room == rm_Overworld) {
		game_end();
	} else {
		end_minigame(global.win);
		if (global.win) show_debug_message("WIN RAR")
		audio_stop_all();
		exitTimer = exitTime;
		exitTimerMaxTime = exitTime;
		miniTitleAlpha = 0;
	}
}