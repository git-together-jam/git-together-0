/// @description Insert description here
// You can write your code in this editor
if action=0{
	var _dir=irandom(6)
	switch _dir{
		case 0: spd[0]=1;spd[1]=0;image_index=2;index_hold=2;break;
		case 1: spd[0]=0;spd[1]=1;image_index=3;index_hold=3;break;
		case 2: spd[0]=-1;spd[1]=0;image_index=1;index_hold=1;break;
		case 3: spd[0]=0;spd[1]=-1;image_index=0;index_hold=0;break;
		case 4: spd[0]=0;spd[0]=0;shoot=1;break;
		case 5: spd[0]=0;spd[0]=0;shoot=1;break;
		case 6: spd[0]=0;spd[0]=0;shoot=1;break;
	}
	action=1
	alarm[0]=irandom_range(60,90)
}
if shoot=1{
	with (instance_create_depth(x,y,-1110,obj_ad_bullet)){
		if other.image_index=0{hspd=-1}
		if other.image_index=1{xspd=-1}
		if other.image_index=2{xspd=1}
		if other.image_index=3{hspd=1}
	}
	shoot=0
}
		
if (place_meeting(x+spd[0],y,obj_ad_enwall)) {
	x = round(x);
	while(!place_meeting(x+sign(spd[0]),y,obj_ad_enwall)) {
		x += sign(spd[0]);
	}
	spd[0] = 0;
} else {
	x += spd[0];
}
if (place_meeting(x,y+spd[1],obj_ad_enwall)) {
	y = round(y);
	while(!place_meeting(x,y+sign(spd[1]),obj_ad_enwall)) {
		y += sign(spd[1]);
	}
	spd[1] = 0;
} else {
	y += spd[1];
}

if inv=0{
	if place_meeting(x,y,obj_ad_sword){
		hp--
		alarm[2]=10
		inv=1
	}
}

if inv=1{
	if toggle=0{
		image_index=4
		toggle++
		exit;
	}
	if toggle=1{
		toggle++
		exit;
	}
	if toggle=2{
		image_index=index_hold
		toggle++
		exit;
	}
	if toggle=3{
		toggle++
		exit;
	}
	if toggle=4{
		toggle=0
	}
}
if hp=0{ instance_destroy(self)}