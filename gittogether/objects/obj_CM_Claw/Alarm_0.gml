/// @description Move to drop
state = CMClawState.dropping;
with(instance_nearest(x,y+76,obj_CM_Prize)) {
	if distance_to_point(other.x,other.y+other.sprYOffset) < 32 {
		//if !irandom(200) { // So it's rigged
			slipChance = irandom(600);
			grabbed = true;	
			other.prizeGrabbed = id;
			other.grabXOffset = x;
			other.grabYOffset = y;
		//}
	}
}