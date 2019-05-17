/// @desc 

if (life <= 0) {
	end_minigame();
	exit;
}

// Input (with controller support)
var _rInput = max(keyboard_check(vk_right), keyboard_check(ord("D")), gamepad_axis_value(global.Controller,gp_axislh) > CONTROLLER_DEADZONE);
var _uInput = max(keyboard_check(vk_up), keyboard_check(ord("W")), gamepad_axis_value(global.Controller,gp_axislv) < -CONTROLLER_DEADZONE);
var _lInput = max(keyboard_check(vk_left), keyboard_check(ord("A")), gamepad_axis_value(global.Controller,gp_axislh) < -CONTROLLER_DEADZONE);
var _dInput = max(keyboard_check(vk_down), keyboard_check(ord("S")), gamepad_axis_value(global.Controller,gp_axislv) > CONTROLLER_DEADZONE);
var _shootInput = max(keyboard_check(vk_space), keyboard_check(ord("X")), gamepad_button_check_pressed(global.Controller,gp_face1));

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
		audio_play_sound(snd_as_player_shoot, 100, false);
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

if (!god) {
	if (place_meeting(x, y, obj_as_rock_parent)) {
		god = true;
		alarm[0] = room_speed*3;
	
		repeat(irandom_range(8, 12)) {
			instance_create_depth(x, y, depth, obj_as_particle);
		}
		
		audio_play_sound(snd_as_player_death, 100, false);
		
		x = xstart;
		y = ystart;
		speed = 0;
		direction = 0;
		life--;
	}
}

image_blend = god ? c_gray : c_white

if (!instance_exists(obj_as_rock_parent)) end_minigame(true);