/// @description
switch(state) {
	case WkStates.Idle:
		//Animation
		sprite_index = spr_wk_vikingidle;
		//Idle
		hsp = 0;
		//Walk
		if (global.iMoveX != 0) {
			state = WkStates.Walk;
			hsp = global.iMoveX;
			facing = sign(global.iMoveX);
		}
		//Jump
		if (global.iMoveY < 0) {
			state = WkStates.Jump;
			vsp = -5;
		}
		//Fall
		if (!place_meeting(x,y+1,obj_wk_grasstile)) {
			state = WkStates.Jump;
		}
		break;
	case WkStates.Walk:
		//Animation
		sprite_index = spr_wk_vikingwalk;
		if (global.iMoveX != 0) {
			facing = sign(global.iMoveX);
		}
		//Walk
		hsp = global.iMoveX;
		//Idle
		if (global.iMoveX == 0) {
			state = WkStates.Idle;
			hsp = 0;
		}
		//Jump
		if (global.iMoveY < 0) {
			state = WkStates.Jump;
			vsp = -5;
		}
		//Fall
		if (!place_meeting(x,y+1,obj_wk_grasstile)) {
			state = WkStates.Jump;
		}
		break;
	case WkStates.Jump:
		//Animation
		sprite_index = spr_wk_vikingjump;
		//Gravity
		vsp = min(vsp + 0.3, 10);
		//Moving in the air
		hsp = global.iMoveX;
		//Landing
		if (place_meeting(x,y+1,obj_wk_grasstile)) {
			//Idle
			if (global.iMoveX == 0) {
				state = WkStates.Idle;
				hsp = 0;
			} else {
				state = WkStates.Walk;
				hsp = global.iMoveX;
			}
		}
		break;
}

//Collisions
repeat(abs(hsp)) {
	if (!place_meeting(x+sign(hsp),y,obj_wk_grasstile)) {
		x += sign(hsp);
	} else {
		hsp = 0;
		break;
	}
}
repeat(abs(vsp)) {
	if (!place_meeting(x,y+sign(vsp),obj_wk_grasstile)) {
		y += sign(vsp);
	} else {
		vsp = 0;
		break;
	}
}