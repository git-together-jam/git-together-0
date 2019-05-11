/// @description Init variables
hsp = 0;
vsp = 0;
spd = 1;

enum CMClawState {
	idle,
	moving,
	grabbing,
	dropping,
	dropped,
	reset
}

clawDropOff = 82;
startingPos = room_width/2;
sprYOffset = sprite_get_bbox_bottom(sprite_index)/2;
grabXOffset = 0;
grabYOffset = 0;

grabbed = false;
prizeGrabbed = noone;
state = CMClawState.idle;

image_speed = 0;
image_index = 0;
x = startingPos;