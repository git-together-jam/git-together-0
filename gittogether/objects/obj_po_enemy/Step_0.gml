///@desc Handle movement.

if instance_exists(obj_po_ball) {
	
	vspeed = .92*vspeed+.04*(obj_po_ball.y-y+random(20)-10)*obj_po_ball.start;
}