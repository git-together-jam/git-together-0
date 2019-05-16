//delete if colliding with something first frame
if (!instanceCheck){
	instanceCheck = true;
	if (image_angle == 270){
		if (instance_place(x,y+5,obj_frog_truckkun) || instance_place(x,y-5,obj_frog_truckkun)) {
			instance_destroy(id);
			instanceCheck = false;
		}
	}else{
		if (instance_place(x+5,y,obj_frog_truckkun) || instance_place(x-5,y,obj_frog_truckkun)) {
			instance_destroy(id);
			instanceCheck = false;
		}
	}
}
if (!instanceCheck) exit; // failed test

//movement
x += vx;
y += vy;
image_xscale = sign(-vx)+sign(-vy);

//delete when offscreen
if	(vx>0 && x>room_width+100) ||
	(vx<0 && x<-100) ||
	(vy>0 && y>room_height+100) ||
	(vy<0 && y<-100){
	instance_destroy(id);
}


//explosions
if (explode) {
	if (sprite_index == spr_frog_truckkun){
		if (image_angle == 270){
			instance_create_depth(x,y,depth-50,obj_frog_explosion);
			instance_create_depth(x,y+16,depth-50,obj_frog_explosion);
			instance_create_depth(x,y-16,depth-50,obj_frog_explosion);
		}else{
			instance_create_depth(x,y,depth-50,obj_frog_explosion);
			instance_create_depth(x+16,y,depth-50,obj_frog_explosion);
			instance_create_depth(x-16,y,depth-50,obj_frog_explosion);
		}
	}else if (is(sprite_index,spr_frog_car1,spr_frog_car2)){
		if (image_angle == 270){
			instance_create_depth(x,y+8,depth-50,obj_frog_explosion);
			instance_create_depth(x,y-8,depth-50,obj_frog_explosion);
		}else{
			instance_create_depth(x+8,y,depth-50,obj_frog_explosion);
			instance_create_depth(x-8,y,depth-50,obj_frog_explosion);
		}
	}
	instance_destroy(id);
}

if (instance_place(x,y,obj_frog_truckkun) || instance_place(x,y,obj_frog_water)){
	explode = true;
}