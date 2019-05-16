



var _move_speed = 10 / TURN_TIME;

var _x_dir = sign( new_x - x);
x += _move_speed * _x_dir;
if abs( new_x - x) < 6 {	
	x = new_x;	
}
var _y_dir = sign( new_y - y);
y += _move_speed * _y_dir;
if abs( new_y - y) < 6 {	
	y = new_y;		
}