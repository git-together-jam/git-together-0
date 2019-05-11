/// @description Collision

isGrounded = place_meeting(x,y+1,obj_CM_Col);

if !isGrounded && !grabbed && (vsp < 20) {
	vsp += grav;	
}

if !(grabbed) && !isGrounded {
	image_angle+=dir;	
}

if (grabbed) {
	x = obj_CM_Claw.x;
	y = obj_CM_Claw.bbox_bottom-16;
	slipChance--;
	
	if slipChance == 0 {
		grabbed = false;	
	}
}


if place_meeting(x+hsp,y,obj_CM_Col) {
	while !(place_meeting(x+sign(hsp),y,obj_CM_Col)) {
		x++;	
	}
	hsp = 0;
}

x += hsp;

if place_meeting(x,y+vsp,obj_CM_Col) {
	while !(place_meeting(x,y+sign(vsp),obj_CM_Col)) {
		y++;	
	}
	vsp = 0;
}

y += vsp;