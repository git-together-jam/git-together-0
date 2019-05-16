usernm = userinput[0]+userinput[1]+userinput[2];
if string_length(usernm) > 3{
usernm = string_copy(usernm, 1, 3);
}
usernm = string_letters(usernm);
if (global.iSelect && usernm != "" && useredit == 3){
	global.froggerUser = usernm
	room_goto(rm_frogger_highscore);
}

//edit username
if (global.iMoveX != 0 && movetimer <= 0){
	useredit += global.iMoveX;
	if (useredit < 0) useredit = 3;
	if (useredit > 3) useredit = 0;
	movetimer = movetime;
	show_debug_message(string(useredit))
}
if (global.iMoveY != 0 && movetimer <= 0){
	userletter -= global.iMoveY;
	if (userletter < 0) userletter = 25;
	if (userletter > 25) userletter = 0;
	movetimer = movetime;
	show_debug_message(string(userletter))
	if (useredit < 3)userinput[useredit] = letters[userletter];
}
movetimer--;