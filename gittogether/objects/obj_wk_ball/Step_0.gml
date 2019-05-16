if (obj_wk_viking.wk_Action = 3) {
	wk_BallSpeed -= 1
	if (wk_Ball > 0) {
		if (wk_BallSpeed <= 0) {
		if (obj_wk_viking.image_xscale = 1) {
			instance_create_depth(obj_wk_viking.x + 12 + (16 * (10 - wk_Ball)), obj_wk_viking.y + 1, 0 , obj_wk_chain);
			x = (obj_wk_viking.x + 28 + (16 * (10 - wk_Ball)))
		}
		if (obj_wk_viking.image_xscale = -1) {
			instance_create_depth(obj_wk_viking.x - 28 - (16 * (10 - wk_Ball)), obj_wk_viking.y + 1, 0 , obj_wk_chain);
			x = (obj_wk_viking.x - 28 - (16 * (10 - wk_Ball)))
		}
		if wk_Ball <= 3 {
			obj_wk_chain.sprite_index = spr_wk_bigchain
		} else {
			obj_wk_chain.sprite_index = spr_wk_smallchain
		}
		wk_Ball -= 1
		wk_BallSpeed = 10
	}
	} else {
		obj_wk_ball.x = -96
		obj_wk_ball.y = 240
		instance_deactivate_object(obj_wk_ball)
		instance_destroy(obj_wk_chain)
		obj_wk_viking.wk_Action = 0
	}
}
if (obj_wk_viking.wk_Action = 2) {
	x = (obj_wk_viking.x + (obj_wk_viking.image_xscale * 28))
	y = obj_wk_viking.y
	wk_Ball = 10
	obj_wk_viking.wk_Action = 3
}
