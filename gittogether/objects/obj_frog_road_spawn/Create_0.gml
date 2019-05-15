//determines direction, should only exist offscreen
if (x<0 || y <0) type = 1;
else type = -1;

if (x<0 || x>room_width) hori = true;
else hori = false;

truckTime = 1*room_speed;
truckTimer = truckTime + random_range(-.9*room_speed,-5*room_speed);

truckMoveSpeed = 3;

if hori{
	repeat(2) {
		var _inst = instance_create_layer(random_range(0,room_width),y,"Truck_kun",obj_frog_truckkun);
		with (_inst) vx = other.type*other.truckMoveSpeed;
	}
}else{
	repeat(1) {
		var _inst = instance_create_layer(x,random_range(0,room_height),"Truck_kun",obj_frog_truckkun);
		with (_inst) {
			image_angle = 270;
			vy = other.type*other.truckMoveSpeed;
		}
	}
}