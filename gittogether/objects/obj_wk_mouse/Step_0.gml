if (!place_meeting(x, y + 1 , obj_wk_error)) {
	y += 1
}
if (abs(obj_wk_viking.x - x) < 420 && abs(obj_wk_viking.y - y) < 240) {
	if (abs(obj_wk_viking.x - x) < 150 && abs(obj_wk_viking.y - y) < 90) {
		sprite_index = spr_wk_mouse
		if (place_meeting(x + wk_mousespeed, y, obj_wk_error) || (place_meeting(x + wk_mousespeed, y, obj_wk_viking))) {
			image_xscale = image_xscale * -1
			wk_mousespeed = wk_mousespeed * -1
		}
		x = x + wk_mousespeed
	} else {
		if (obj_wk_viking.x < x && image_xscale = 1) {
			image_xscale = image_xscale * -1
			wk_mousespeed = wk_mousespeed * -1
		}
		sprite_index = spr_wk_mouseattack
		if image_index > image_number - 1 {
			instance_create_depth(x, y, depth, obj_wk_mousefire);
			image_index = 0
		}
	}
}