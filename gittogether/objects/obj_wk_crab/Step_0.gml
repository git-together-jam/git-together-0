if (place_meeting(x + wk_crabspeed, y, obj_wk_error)) {
	image_xscale = image_xscale * -1
	wk_crabspeed = wk_crabspeed * -1
}
x = x + wk_crabspeed
if (!place_meeting(x, y + 1 , obj_wk_error)) {
	y += 1
}
wk_crabclaw.x = x
wk_crabclaw.y = y
wk_crabclaw.image_xscale = image_xscale
if (place_meeting(x, y, obj_wk_error)) {
	y += 2
}