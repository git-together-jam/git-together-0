if (obj_wk_viking.wk_Action = 1) {
	x = (obj_wk_viking.x + (obj_wk_viking.image_xscale * 12))
	y = obj_wk_viking.y
	image_xscale = obj_wk_viking.image_xscale
	wk_swordtime -= 1
	if (wk_swordtime <= 0) {
		obj_wk_sword.x = -96
		obj_wk_sword.y = 240
		obj_wk_viking.wk_Action = 0
		instance_deactivate_object(obj_wk_sword)
	}
}
