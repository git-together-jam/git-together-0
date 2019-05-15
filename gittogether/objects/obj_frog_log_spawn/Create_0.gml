//determines direction, should only exist offscreen
if (x<0 || y <0) type = 1;
else type = -1;

if (x<0 || x>room_width) hori = true;
else hori = false;

turtleTime = 3*room_speed;
turtleTimer = turtleTime + random_range(-room_speed,room_speed);

turtleMoveSpeed = 1;

if hori{
	repeat(2) {
		var _inst = instance_create_layer(random_range(0,room_width),y,"Turtles",obj_frog_turtle);
		with (_inst){
			vx = other.type*other.turtleMoveSpeed;
			sprite_index = choose(spr_frog_log,spr_frog_llog);
		}
	}
}else{
	repeat(1) {
		var _inst = instance_create_layer(x,random_range(0,room_height),"Turtles",obj_frog_turtle);
		with (_inst){
			image_angle = 270;
			vy = other.type*other.turtleMoveSpeed;
			sprite_index = choose(spr_frog_log,spr_frog_llog);
		}
	}
}