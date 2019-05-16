if (room == rm_Overworld){
	instance_destroy(id);
	exit;
}
if (!is(room,rm_frogger,rm_frogger_user,rm_frogger_highscore)) global.froggerTime++;