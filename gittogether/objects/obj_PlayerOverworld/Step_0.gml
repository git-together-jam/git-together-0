/// @description
#region Movement 
// Movement
hsp = global.iMoveX * moveSpeed;
vsp = global.iMoveY * moveSpeed;

// Check for collisions and move one pixel at a time.
// Horizontal:
repeat(abs(hsp)) {
	
	if instance_place(x+sign(hsp), y, par_Collide) break;
	x+=sign(hsp);
}
// Vertical:
repeat(abs(vsp)) {
	
	if instance_place(x, y+sign(vsp), par_Collide) break;
	y+=sign(vsp);
}

// Clamp Player to room boundaries

// Get bbox variables to use with clamping
var _bbox_left = sprite_get_bbox_left(sprite_index);
var _bbox_top = sprite_get_bbox_top(sprite_index);
var _bbox_right = sprite_get_bbox_right(sprite_index)/2;
var _bbox_bottom = sprite_get_bbox_bottom(sprite_index)/2;

// Clamp
x = clamp(x,_bbox_left,room_width-_bbox_right);
y = clamp(y,_bbox_top,room_height-_bbox_bottom);


#endregion

// Play with arcade machine
arcade = instance_place(x, y-4, obj_ArcadeMachine);

if (global.iSelect && arcade) {
	start_minigame(arcade.gameRoom, arcade.name, arcade.trans, arcade.transCol,
				   arcade.titleFont, arcade.titleCol);
}

//Animation
if (arcade) {
	arcadeSelectTime += 2.5;
} else {
	arcadeSelectTime = 0;
}