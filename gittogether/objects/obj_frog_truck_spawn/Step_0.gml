if (truckTimer <= 0){
	if hori{
		var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
		with (_inst){
			vx = other.type*other.truckMoveSpeed;
			sprite_index = spr_frog_truckkun;
		}
	}else{
		var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
		with (_inst){
			image_angle = 270;
			vy = other.type*other.truckMoveSpeed;
			sprite_index = spr_frog_truckkun;
		}
	}
	truckTimer = truckTime + random_range(-.5*room_speed,room_speed);
}else{
	truckTimer--;
}