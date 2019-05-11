///@desc Handle starting/movement.

flash *= .9;

//Bounce off top or bottom.
if (abs(y+vspeed-RES_H/2) >= RES_H/2) {
	
	vspeed *= -1;
}

//Handle the start or when the ball goes out the sides.
if (!start && global.iMouseL_P) || (abs(x+hspeed-RES_W/2) >= RES_W/2) {
	
	flash = start;
	start = 1;
	
	//Add points.
	playerScore += (x>RES_W/2);
	enemyScore  += (x<RES_W/2);
	
	//Reset ball.
	x = RES_W/2;
	y = RES_H/2;
	hspeed = choose(-3,3);
	vspeed = choose(-3,3);
}

//Bounce off paddles.
if (hspeed<0) && place_meeting(x+hspeed,y,obj_po_player) {
	
	hspeed = -hspeed+.2;
}
if (hspeed>0) && place_meeting(x+hspeed,y,obj_po_enemy) {
	
	hspeed = -hspeed-.2;
}
