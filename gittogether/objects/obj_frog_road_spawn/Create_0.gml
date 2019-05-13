//determines direction, should only exist offscreen
if (x<0) type = 1;
else type = -1;

truckTime = 1*room_speed;
truckTimer = truckTime + random_range(-.9*room_speed,-5*room_speed);

truckMoveSpeed = 3;