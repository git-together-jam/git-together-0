//Movement
if (moveTimer <= 0){
	xMove = 0;
	yMove = 0;
	if (control){
		if(global.iMoveX != 0){
			moveTimer = moveTime;
			xscale = .6;
			yscale = 1.4;
			image_angle = -global.iMoveX*90;
			xMove = global.iMoveX*moveSpeed;
			yMove = 0;
			audio_play_sound_varied(snd_frog_jump,50,false);
		}
		else if(global.iMoveY != 0){
			moveTimer = moveTime;
			xscale = .6;
			yscale = 1.4;
			image_angle = (global.iMoveY*90) + 90;
			xMove = 0;
			yMove = global.iMoveY*moveSpeed;
			audio_play_sound_varied(snd_frog_jump,50,false);
		}
	}
}
//On the river
if (instance_place(x,y,obj_frog_water)){
	if (instance_place(x,y,obj_frog_turtle)){
		with (instance_place(x,y,obj_frog_turtle)){
			if (other.xMove != 0) other.xMove += .3*vx;
			if (other.moveTimer <= 0) other.xMove += vx;
		}
	}else{
		room_goto_transition(rm_frogger,TransType.checkerboard,c_black);
		if (control)audio_play_sound(snd_frog_lose,100,false);
		control = false;
	}
}

x+=xMove;
y+=yMove;
moveTimer--;
	

//squash and stretch
xscale = approach(xscale,1,.05);
yscale = approach(yscale,1,.05);

