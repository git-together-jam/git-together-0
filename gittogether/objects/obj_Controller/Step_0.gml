if (global.iExit) exitTimer--;
else exitTimer = exitTime;
if (exitTimer <= 0){
	end_minigame();
	exitTimer = exitTime;
	miniTitleAlpha = 0;
}