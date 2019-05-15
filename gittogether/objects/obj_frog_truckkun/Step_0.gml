//delete if colliding with something first frame
if (!instanceCheck){
	if (instance_place(x,y,obj_frog_truckkun)) instance_destroy(id);
	instanceCheck = true;
}

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