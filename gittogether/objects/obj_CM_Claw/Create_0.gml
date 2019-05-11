/// @description Init variables
hsp = 0;
vsp = 0;
spd = 1;

enum CMClawState {
	idle,
	moving,
	grabbing,
	dropping
}

grabbed = false;
state = CMClawState.idle;

image_speed = 0;
image_index = 0;