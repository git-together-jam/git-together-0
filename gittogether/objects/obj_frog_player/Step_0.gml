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
			emit_dust(1.6,x,y,-global.iMoveX,-global.iMoveX,-.5,.5,depth+1,c_white);
		}
		else if(global.iMoveY != 0){
			moveTimer = moveTime;
			xscale = .6;
			yscale = 1.4;
			image_angle = (global.iMoveY*90) + 90;
			xMove = 0;
			yMove = global.iMoveY*moveSpeed;
			audio_play_sound_varied(snd_frog_jump,50,false);
			emit_dust(1.6,x,y,-.5,.5,-global.iMoveY,-global.iMoveY,depth+1,c_white);
		}
	}
}//else{ emit_dust(.5,x,y,-1,1,-1,1,depth+1,c_white);}
//On the river
if (instance_place(x,y,obj_frog_water)){
	if (instance_place(x,y,obj_frog_turtle) && control){
		var die = false;
		with (instance_place(x,y,obj_frog_turtle)){
			if (image_index <= 54){
				if (other.xMove != 0) other.xMove += .3*vx; //dont question this magic okay
				if (other.moveTimer <= 0) other.xMove += vx;
			}else{
				var die = true;
			}
		}
		if (die) frog_die();
	}else{
		frog_die();
	}
}
//On the road
if (instance_place(x,y,obj_frog_truckkun)){
	frog_die();
}
//offscreen
if ((room_type == 0 && (x<0 || x>room_width)) ||
	(room_type == 1 && (y<0 || y>room_height))||
	(room_type == 2 && (x<0 || x>room_width || y<0 || y>room_height))){
	frog_die();
}
//die
if (!control){
	image_angle += sign(xscale)*10;
	xscale = lerp(xscale,0,.2);
	yscale = lerp(yscale,0,.2);
}
//goal
if (instance_exists(obj_frog_goal)){
	if (instance_place(x,y,obj_frog_goal) && control){
		control = false;
		if (room != rm_frogger4) room_goto_transition(room_next(room),TransType.circle,c_black,room_nm,fnt_big,c_white);
		else end_minigame();
		audio_play_sound(snd_frog_win,100,false);
		with (instance_place(x,y,obj_frog_goal)){
			image_xscale = lerp(image_xscale,0,.2);
			image_yscale = lerp(image_yscale,0,.2);
		}
	}
}
		

//move
x+=xMove;
y+=yMove;
moveTimer--;

//no offscreen shenanigans
y = clamp(y,0,(room_height div 16)*16)
	

//squash and stretch
xscale = approach(xscale,1,.05);
yscale = approach(yscale,1,.05);