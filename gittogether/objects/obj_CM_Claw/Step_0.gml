/// @description Main Code

// Get State
/*switch(state) {
	
}*/

if (state == CMClawState.idle) && (global.iMoveY > 0) {
	state = CMClawState.moving;	
}

if (state == CMClawState.moving) {
	vsp = spd;
} 

if (state == CMClawState.idle) {
	hsp = global.iMoveX;	
}	

x += hsp*spd;
y += vsp;

// Reset movement values
hsp = 0;
vsp = 0;

x = clamp(x,sprite_get_bbox_left(sprite_index),room_width-sprite_get_bbox_right(sprite_index));
//y = clamp(y,sprite_get_bbox_top(sprite_index),room_height-sprite_get_bbox_bottom(sprite_index));

if (state == CMClawState.moving) && (y > room_height-sprite_get_bbox_bottom(sprite_index)-4) {
	alarm[0] = 60;
	state = CMClawState.grabbing;	
}