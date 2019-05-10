/// @desc 

var _rInput = max(keyboard_check(vk_right), keyboard_check(ord("D")));
var _uInput = max(keyboard_check(vk_up), keyboard_check(ord("W")));
var _lInput = max(keyboard_check(vk_left), keyboard_check(ord("A")));
var _dInput = max(keyboard_check(vk_down), keyboard_check(ord("S")));

var _hdir = _rInput - _lInput;
var _vdir = _dInput - _uInput;

if (_hdir != 0) {
	image_angle -= _hdir*4;
	direction = image_angle;
}
if (_vdir != 0) speed = clamp(speed-.05*_vdir, .1, maxSpeed);

move_wrap(true, true, sprite_width);