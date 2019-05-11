///@desc Handle movement.

//Squish back to normal.
image_xscale = power(image_xscale,.9);
image_yscale = power(image_yscale,.9);

//Move randomly with ball.
if instance_exists(obj_po_ball) {
	
	vspeed = .92*vspeed+.04*(obj_po_ball.y-y+random(20)-10)*obj_po_ball.start;
}