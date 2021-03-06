/// @description
#region Movement 
// Movement
var _moveDir = point_direction(0,0,global.iMoveX,global.iMoveY);
if (global.iMoveX == 0 && global.iMoveY == 0) var _moveDist = 0;
else var _moveDist = 1;
hsp = lengthdir_x(_moveDist,_moveDir) * moveSpeed;
vsp = lengthdir_y(_moveDist,_moveDir) * moveSpeed;

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

if (!instance_exists(obj_Transition)) {
	if (global.iSelect && arcade && !startedGame) {
	
		if (global.Coins >= DEF_COIN_COST) {
			global.Coins -= DEF_COIN_COST;
		
			obj_Controller.shaderEnabled = arcade.shaderEnabled;
			obj_Controller.shaderSet = arcade.shaderSet;
	
			start_minigame(arcade.type, arcade.gameRoom, arcade.name, arcade.trans,
						   arcade.transCol, arcade.titleFont, arcade.titleCol);
				   
			startedGame = true;
			//save position
			global.Overworldx = x;
			global.Overworldy = y;
		} else {
			room_goto_transition(rm_Overworld, TransType.screenFade, c_black,
								"NOT ENOUGH COINS!", fnt_big, c_white);
		}
	}
}

//Animation
if (arcade) {
	arcadeSelectTime += 2.5;
} else {
	arcadeSelectTime = 0;
}

if (trash_read_time > 0) {
	trash_read_time--;
} else {
	trash_read = false;
}