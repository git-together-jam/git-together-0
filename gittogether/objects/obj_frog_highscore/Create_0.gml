/// Initialise loading the online highscores
player_name = global.froggerUser;
if (player_name != ""){
	send_score(global.froggerUser,global.froggerTime);
	sys_save_global_write("frogger secret", true);
}
text = "Please wait for the\nhighscores to load...";
text2 = "";
alarm[2] = 2*room_speed;
wait = false;
set = false;