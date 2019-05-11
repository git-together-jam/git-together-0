//Movement
if (moveTimer <= 0){
	xMove = 0;
	yMove = 0;
	if(global.iMoveX != 0){
		moveTimer = moveTime;
		xscale = .6;
		yscale = 1.4;
		image_angle = -global.iMoveX*90;
		xMove = global.iMoveX*moveSpeed;
		yMove = 0;
	}
	else if(global.iMoveY != 0){
		moveTimer = moveTime;
		xscale = .6;
		yscale = 1.4;
		image_angle = (global.iMoveY*90) + 90;
		xMove = 0;
		yMove = global.iMoveY*moveSpeed;
	}
}
//On the river
if (instance_place(x,y,obj_frog_water)){
	if (instance_place(x,y,obj_frog_turtle)){
		with (instance_place(x,y,obj_frog_turtle)){
			if (other.moveTimer <= 0) other.xMove += vx;
		}
	}else{
		room_goto_transition(rm_frogger,TransType.checkerboard,c_black);
	}
}

x+=xMove;
y+=yMove;
moveTimer--;
	

//squash and stretch
xscale = approach(xscale,1,.05);
yscale = approach(yscale,1,.05);

