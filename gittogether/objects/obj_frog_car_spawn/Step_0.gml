if (truckTimer <= 0){
	if hori{
		var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
		with (_inst){
			vx = other.type*truckMoveSpeed;
			sprite_index = choose(spr_frog_car1,spr_frog_car2);
		}
	}else{
		var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
		with (_inst){
			image_angle = 270;
			vy = other.type*truckMoveSpeed;
			sprite_index = choose(spr_frog_car1,spr_frog_car2);
		}
	}
	truckTimer = truckTime + random_range(-.5*room_speed,room_speed);
}else{
	truckTimer--;
}