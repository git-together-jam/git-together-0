if (place_meeting(x + wk_snailspeed, y, obj_wk_error)) {
	image_xscale = image_xscale * -1
	wk_snailspeed = wk_snailspeed * -1
}
if (!place_meeting(x + (wk_snailspeed * 16), y + 1 , obj_wk_error)) {
	image_xscale = image_xscale * -1
	wk_snailspeed = wk_snailspeed * -1
}
x = x + wk_snailspeed
wk_snailhouse.x = x
wk_snailhouse.image_xscale = image_xscale