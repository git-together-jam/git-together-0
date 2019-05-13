///@desc Handle movement.

//Squish back to normal.
image_xscale = power(image_xscale,.9);
image_yscale = power(image_yscale,.9);

//Move with mouse.
y += global.iMoveY*spd;

/* 
Made a hack to the mouse movement here
So that way it doesn't intefere with the global inputs.
*/
if (abs(memMouseY-mouse_y)>.1) {
	memMouseY = memMouseY*.8+.2*mouse_y;
	y = memMouseY;
}
y = clamp(y,0,room_height);