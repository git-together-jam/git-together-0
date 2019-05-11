// Horizontal movement
var hsp = moveSpeed * global.iMoveX;

// Collisions
if (hsp > 0) {
	repeat(hsp) {
		if (bbox_right + 1 < room_width) x += 1;
	}
} else {
	repeat(abs(hsp)) {
		if (bbox_left - 1 > 0) x -= 1;
	}
}
