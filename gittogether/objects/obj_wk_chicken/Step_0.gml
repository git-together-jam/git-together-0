if (place_meeting(x + wk_chickenspeedx, y + wk_chickenspeedy, obj_wk_error)) {
	if (place_meeting(x + wk_chickenspeedx, y, obj_wk_error)) {
		wk_chickenspeedx = -1 * wk_chickenspeedx
		image_xscale = image_xscale * -1
	}
	if (place_meeting(x, y + wk_chickenspeedy, obj_wk_error)) {
		wk_chickenspeedy = -1 * wk_chickenspeedy
	}
}
x = x + wk_chickenspeedx
y = y + wk_chickenspeedy