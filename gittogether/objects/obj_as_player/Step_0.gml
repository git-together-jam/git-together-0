/// @desc 

// Input
var _rInput = max(keyboard_check(vk_right), keyboard_check(ord("D")));
var _uInput = max(keyboard_check(vk_up), keyboard_check(ord("W")));
var _lInput = max(keyboard_check(vk_left), keyboard_check(ord("A")));
var _dInput = max(keyboard_check(vk_down), keyboard_check(ord("S")));
var _shootInput = max(keyboard_check(vk_space), keyboard_check(ord("X")));

// Movement
var _hdir = _rInput - _lInput;
var _vdir = _dInput - _uInput;

if (_hdir != 0) {
	image_angle -= _hdir*3;
	direction = image_angle;
}
if (_vdir != 0) speed = clamp(speed-.05*_vdir, .1, maxSpeed);

move_wrap(true, true, sprite_width);

// Shooting
if (canShoot) {
	if (_shootInput) {
		var _xx = x + lengthdir_x(8, direction),
			_yy = y + lengthdir_y(8, direction);
		with (instance_create_depth(_xx, _yy, depth, obj_as_bullet)) {
			direction = other.direction;
		}
		canShoot = false;
	}
} else {
	timer--;
	if (timer <= 0) {
		timer = shootTimer;
		canShoot = true;
	}
}