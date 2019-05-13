if (truckTimer <= 0){
	var _inst = instance_create_layer(x,y,"Truck_kun",obj_frog_truckkun);
	with (_inst) vx = other.type*other.truckMoveSpeed;
	truckTimer = truckTime + random_range(-.5*room_speed,room_speed);
}else{
	truckTimer--;
}