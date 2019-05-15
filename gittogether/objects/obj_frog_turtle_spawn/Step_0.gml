if (turtleTimer <= 0){
	if hori{
		var _inst = instance_create_layer(x,y,"Turtles",obj_frog_turtle);
		with (_inst){
			vx = other.type*other.turtleMoveSpeed;
			sprite_index = choose(spr_frog_turtle2,spr_frog_turtle3);
		}
	}else{
		var _inst = instance_create_layer(x,y,"Turtles",obj_frog_turtle);
		with (_inst){
			image_angle = 270;
			vy = other.type*other.turtleMoveSpeed;
			sprite_index = choose(spr_frog_turtle2,spr_frog_turtle3);
		}
	}
	turtleTimer = turtleTime + random_range(-room_speed,room_speed);
}else{
	turtleTimer--;
}

