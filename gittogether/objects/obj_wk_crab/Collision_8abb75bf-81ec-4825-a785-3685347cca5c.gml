if (obj_wk_viking.x -12 <= x) {
	instance_destroy(wk_crabclaw)
	instance_destroy()
} else {
obj_wk_viking.wk_life -= 1
instance_destroy(wk_crabclaw)
instance_destroy()
}