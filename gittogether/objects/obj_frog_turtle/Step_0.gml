//delete if colliding with something first frame
if (!instanceCheck){
	if (instance_place(x,y,obj_frog_turtle)) instance_destroy(id);
	instanceCheck = true;
}

//movement
x += vx;
y += vy;
if (sprite_index == spr_frog_turtle2 or sprite_index == spr_frog_turtle3)image_xscale = sign(vx) + sign(vy);

//delete when offscreen
if	(vx>0 && x>room_width+100) ||
	(vx<0 && x<-100) ||
	(vy>0 && y>room_height+100) ||
	(vy<0 && y<-100){
	instance_destroy(id);
}

//explosions
if (explode) {
	if (is(sprite_index,spr_frog_llog,spr_frog_turtle3)){
		if (image_angle == 270){
			instance_create_depth(x,y,depth-50,obj_frog_explosion);
			instance_create_depth(x,y+16,depth-50,obj_frog_explosion);
			instance_create_depth(x,y-16,depth-50,obj_frog_explosion);
		}else{
			instance_create_depth(x,y,depth-50,obj_frog_explosion);
			instance_create_depth(x+16,y,depth-50,obj_frog_explosion);
			instance_create_depth(x-16,y,depth-50,obj_frog_explosion);
		}
	}else if (is(sprite_index,spr_frog_log,spr_frog_turtle2)){
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
if (instance_place(x,y,obj_frog_turtle)){
	var _explodeinst = instance_place(x,y,obj_frog_turtle);
	if (_explodeinst.image_index <= 54 && image_index <= 54){
		explode = true;
	}
}