/// @description
// Minigame title

//draw_text(8, 8, "TICKETS : " + string(global.Tickets));
//draw_text(8, 8, "COINS : " + string(global.Coins));

if (miniTitleAlpha > 0) {
	draw_set_font(fntBig);

	var str = "Minigame\n\n" + global.GameName[miniType];
	draw_text_center(RES_W/2, RES_H/2, str, 1, 1, 0, c_dkgray, miniTitleAlpha);

	// Reduce alpha
	miniTitleAlpha -= 0.02;
}
