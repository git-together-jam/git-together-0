//determines direction, should only exist offscreen
if (x<0) type = 1;
else type = -1;

turtleTime = 3*room_speed;
turtleTimer = turtleTime + random_range(-room_speed,room_speed);

turtleMoveSpeed = 1;