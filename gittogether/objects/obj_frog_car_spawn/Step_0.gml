if (truckTimer <= 0){
	var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
	with (_inst){
		vx = other.type*other.truckMoveSpeed;
		sprite_index = choose(spr_frog_car1,spr_frog_car2);
	}
	truckTimer = truckTime + random_range(-.5*room_speed,room_speed);
}else{
	truckTimer--;
}