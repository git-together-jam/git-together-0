



var _move_speed = 10 / TURN_TIME;

var _x_dir = sign( new_x - x);
x += _move_speed * _x_dir;
if abs( new_x - x) < 2 {	
	x = new_x;	
	
	if x <= hGRID_X_OFF {
		x += 200;
		new_x += 200;
	}
	if x >= 200 + hGRID_X_OFF {
		x -= 200;
		new_x -= 200;
	}
	
}
var _y_dir = sign( new_y - y);
y += _move_speed * _y_dir;
if abs( new_y - y) < 2 {	
	y = new_y;	
		
	if y <= hGRID_Y_OFF {
		y += 170;
		new_y += 170;
	}
	if y >= 170 + hGRID_Y_OFF {
		y -= 170;
		new_y -= 170;
	}
	
}