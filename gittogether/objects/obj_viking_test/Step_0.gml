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
			hsp = global.iMoveX * 3;
		}
		//Jump
		if (global.iMoveY < 0) {
			state = WkStates.Jump;
			vsp = -10;
		}
		break;
	case WkStates.Walk:
		//Animation
		sprite_index = spr_wk_vikingwalk;
		//Walk
		hsp = global.iMoveX * 3;
		//Idle
		if (global.iMoveX == 0) {
			state = WkStates.Idle;
			hsp = 0;
		}
		//Jump
		if (global.iMoveY < 0) {
			state = WkStates.Jump;
			vsp = -10;
		}
		break;
	case WkStates.Jump:
		//Animation
		sprite_index = spr_wk_vikingjump;
		//Gravity
		vsp = min(vsp + 1, 10);
		//Landing
		if (place_meeting(x,y+1,obj_wk_stone)) {
			//Idle
			if (global.iMoveX == 0) {
				state = WkStates.Idle;
				hsp = 0;
			} else {
				state = WkStates.Walk;
				hsp = global.iMoveX * 3;
			}
		}
		break;
}

//Collisions
repeat(abs(hsp)) {
	if (!place_meeting(x+sign(hsp),y,obj_wk_stone)) {
		x += sign(hsp);
	} else {
		hsp = 0;
		break;
	}
}
repeat(abs(vsp)) {
	if (!place_meeting(x,y+sign(vsp),obj_wk_stone)) {
		y += sign(vsp);
	} else {
		vsp = 0;
		break;
	}
}