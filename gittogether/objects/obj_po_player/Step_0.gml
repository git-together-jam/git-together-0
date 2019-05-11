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
if (memMouseY != mouse_y) {
	memMouseY = mouse_y;
	y = mouse_y;
}

y = clamp(y,0,room_height);