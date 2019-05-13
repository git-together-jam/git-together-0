///@desc Handle starting/movement.

flash *= .9;

//Bounce off top or bottom.
if (abs(y+vspeed-RES_H/2) >= RES_H/2) {
	
	vspeed *= -1;
}

//Handle when the ball goes out the sides.
if (abs(x+hspeed-RES_W/2) >= RES_W/2) {
	
	audio_play_sound(snd_po_score,0,0);
	flash = 1;
	
	//Add points.
	playerScore += (x>RES_W/2);
	enemyScore  += (x<RES_W/2);
	
	finish = (playerScore>=10)+2*(enemyScore>=10);
	start = false;
	
	//Reset ball.
	x = RES_W/2;
	y = RES_H/2;
	hspeed = 0;
	vspeed = 0;
}
//Start the game when pressed.
if !finish {
	
	if !start && (global.iMouse_LP || global.iSelect) {
	
		start = true;
	
		hspeed = choose(-3,3);
		vspeed = choose(-3,3);
	}

	//Bounce off paddles.
	if (hspeed<0) && place_meeting(x+hspeed,y,obj_po_player) {
	
		obj_po_player.image_xscale = 0.8;
		obj_po_player.image_yscale = 1.2;
		hspeed = -hspeed+.2;
		audio_play_sound(snd_po_bounce,0,0);
	}
	if (hspeed>0) && place_meeting(x+hspeed,y,obj_po_enemy) {
	
		obj_po_enemy.image_xscale = 0.8;
		obj_po_enemy.image_yscale = 1.2;
		hspeed = -hspeed-.2;
		audio_play_sound(snd_po_bounce,0,0);
	}
}
else
{
	instance_destroy(obj_po_line);
	instance_destroy(obj_po_player);
	instance_destroy(obj_po_enemy);
	if (global.iMouse_LP || global.iSelect) then end_minigame();
}
