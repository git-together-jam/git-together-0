if (room == rm_Overworld){
	instance_destroy(id);
	exit;
}
if (!is(room,rm_frogger)) global.froggerTime++;