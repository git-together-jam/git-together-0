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
	end_minigame();
	exitTimer = exitTime;
	miniTitleAlpha = 0;
}