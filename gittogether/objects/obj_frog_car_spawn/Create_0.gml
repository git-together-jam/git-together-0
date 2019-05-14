//determines direction, should only exist offscreen
if (x<0) type = 1;
else type = -1;

truckTime = 1*room_speed;
truckTimer = truckTime + random_range(-.9*room_speed,-5*room_speed);

truckMoveSpeed = 3;


repeat(2) {
	var _inst = instance_create_layer(random_range(0,room_width),y,"Truck_kun",obj_frog_truckkun);
	with (_inst){
		vx = other.type*other.truckMoveSpeed;
		sprite_index = choose(spr_frog_car1,spr_frog_car2);
	}
}