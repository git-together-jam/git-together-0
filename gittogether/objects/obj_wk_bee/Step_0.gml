if (abs(obj_wk_viking.x - x) < 320 && abs(obj_wk_viking.y - y) < 180) {
	x = lerp(x, obj_wk_viking.x, 0.02)
	y =  lerp(y, obj_wk_viking.y, 0.02)
}
if sign(obj_wk_viking.x - x) = 1 {
	image_xscale = 1
} else {
	image_xscale = -1
}