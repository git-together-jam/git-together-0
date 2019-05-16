///@desc Handle movement.

//Squish back to normal.
image_xscale = power(image_xscale,.9);
image_yscale = power(image_yscale,.9);

//Move randomly with ball.
shift = shift*.98+random(4)-2;

if instance_exists(obj_po_ball) {
	
	vspeed = .94*vspeed+.05*(obj_po_ball.y-yprevious+shift);//*obj_po_ball.start);
}