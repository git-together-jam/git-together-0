if (!(global.iMouse_LP = 0) || !(global.iMouse_RP = 0) || !(global.iMoveX = 0) || !(global.iMoveY = 0) || !(global.iSelect = 0)) {
room_goto(rm_wk_game)
}
if wk_txtdir = 0 {
	if (wk_txtimer < 100) {
		wk_txtimer += 1
	} else {
		wk_txtdir = 1
	}
}
if wk_txtdir = 1 {
	if (wk_txtimer > 50) {
		wk_txtimer -= 1
	} else {
		wk_txtimer = 0
		wk_txtdir = 0
	}
}