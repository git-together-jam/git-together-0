if !(wk_Action = 0) {
	sprite_index = spr_wk_vkingthrow
}
if (wk_Action = 0) {
if (global.iMouse_LP = 1) {
	instance_activate_object(obj_wk_sword)
	obj_wk_sword.wk_swordtime = 50
	sprite_index = spr_wk_vkingthrow
	wk_Action = 1
}
if (global.iMouse_RP = 1) {
	instance_activate_object(obj_wk_ball)
	sprite_index = spr_wk_vkingthrow
	wk_Action = 2
}
if (global.iMoveY = 1) {
	wk_Jumpstrenght = 0
	if (((place_meeting(x, y + 1, obj_wk_woodtile)) && (!position_meeting(x, y + 32, obj_wk_error))) || (place_meeting(x, y - 4, obj_wk_woodtile))) {
		y += wk_Gravity
	}
} else {
	if (place_meeting(x, y, obj_wk_error)) {
		if (wk_Jumpstrenght < 5) {
			wk_Jumpstrenght += 1
		}
	} 
}
	if (global.iMoveX) = 1 {
			sprite_index = spr_wk_vikingwalk
			image_xscale = 1
		if !(place_meeting(x + wk_Speed, y, obj_wk_error)) {
			x += wk_Speed
		}
	} else {
		if (global.iMoveX) = -1 {
			sprite_index = spr_wk_vikingwalk
			image_xscale = -1
			if !(place_meeting(x - wk_Speed, y, obj_wk_error)) {
				x -= wk_Speed
			}
		} else {
			sprite_index = spr_wk_vikingidle
		}
	}
if (global.iMoveY = -1 && place_meeting(x, y + 1 , obj_wk_error)) {
	sprite_index = spr_wk_vikingjump
	wk_Jumpstrenght = 20
	y -= wk_JumpSpeed
}

if (wk_Jumpstrenght <= 0) {
	if (!place_meeting(x, y + wk_Gravity , obj_wk_error)) {
		y += wk_Gravity
	} else {
		if (!place_meeting(x, y + 1 , obj_wk_error)) {
			y += 1
		}
	}
}
if place_meeting(x, y - wk_JumpSpeed, obj_wk_grasstile) {
	wk_Jumpstrenght = 0
}

if ((!place_meeting(x, y, obj_wk_error)) && (place_meeting(x, y - wk_JumpSpeed, obj_wk_error)) && (place_meeting(x, y - 48, obj_wk_error))) {
	wk_Jumpstrenght = 0
}
if (wk_Jumpstrenght > 0 ) {
	sprite_index = spr_wk_vikingjump
	wk_Jumpstrenght -= 1
	y -= wk_JumpSpeed
}

if (y > 200) {
	x = wk_spawnx
	y = wk_spawny
	wk_life -= 1
}
}