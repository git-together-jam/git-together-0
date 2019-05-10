///@desc Move.

//Bounce off top or bottom.
if (abs(y+vspeed-RES_H/2) >= RES_H/2) {
	
	vspeed *= -1;
}

if (abs(x+hspeed-RES_W/2) >= RES_W/2) {
	
	playerScore += (x>RES_W/2);
	enemyScore  += (x<RES_W/2);
	
	//Restart.
	x = RES_W/2;
	y = RES_H/2;
	hspeed = choose(-4,4);
	vspeed = choose(-4,4);
}

if place_meeting(x+hspeed,y,obj_po_player) {
	
	hspeed *= -1;
}

if place_meeting(x+hspeed,y,obj_po_enemy) {
	
	hspeed *= -1;
}
