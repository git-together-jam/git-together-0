///@desc Handle movement.

//Squish back to normal.
image_xscale = power(image_xscale,.9);
image_yscale = power(image_yscale,.9);

//Move with mouse.
y = mouse_y;