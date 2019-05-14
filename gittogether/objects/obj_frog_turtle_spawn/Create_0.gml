//determines direction, should only exist offscreen
if (x<0) type = 1;
else type = -1;

turtleTime = 3*room_speed;
turtleTimer = turtleTime + random_range(-room_speed,room_speed);

turtleMoveSpeed = 1;

repeat(2) {
	var _inst = instance_create_layer(random_range(0,room_width),y,"Turtles",obj_frog_turtle);
	with (_inst){
		vx = other.type*other.turtleMoveSpeed;
		sprite_index = choose(spr_frog_turtle2,spr_frog_turtle3);
	}
}