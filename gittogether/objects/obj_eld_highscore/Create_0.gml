/// Initialise loading the online highscores
player_name = global.elduser;
if (player_name != "")eld_send_score(global.elduser,global.eldscore);
text = "Please wait for the\nhighscores to load...";
text2 = "";
alarm[2] = 2*room_speed;
wait = false;
set = false;