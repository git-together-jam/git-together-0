/// @description Insert description here

//Define input vars
var _xinput = (keyboard_check(vk_right)-keyboard_check(vk_left))
var _yinput = (keyboard_check(vk_up)-keyboard_check(vk_down))

if (_xinput!=0) and (_yinput!=0){
	spd[0]=_xinput*2/sqrt(2)
	spd[1]=_yinput*-2/sqrt(2)
} else{
	spd[0]=_xinput*2
	spd[1]=_yinput*-2
}
if _xinput=0{
	if _yinput>0{
		image_index=0
	}
	if _yinput<0{
		image_index=2
	}
}
if _yinput=0{
	if _xinput>0{
		image_index=1
	}
	if _xinput<0{
		image_index=3
	}
}
if _xinput>0{
	if _yinput>0{
		image_index=4
	}
	if _yinput<0{
		image_index=5
	}
}	
if _xinput<0{
	if _yinput>0{
		image_index=7
	}
	if _yinput<0{
		image_index=6
	}
}
//Old code, has some collision bugs
/*
if place_meeting(x,y+spd[1],obj_ad_wall) or place_meeting(x,y+spd[1],obj_ad_wall){
	spd[1]=0
}
if place_meeting(x+spd[0],y,obj_ad_wall) or place_meeting(x+spd[0],y,obj_ad_wall){
	spd[0]=0
}
x+=spd[0]
y+=spd[1]
*/
//New code, doesn't appear to have any bugs so far - Yosi
if (place_meeting(x+spd[0],y,obj_ad_wall)) {
	x = round(x);
	while(!place_meeting(x+sign(spd[0]),y,obj_ad_wall)) {
		x += sign(spd[0]);
	}
	spd[0] = 0;
} else {
	x += spd[0];
}
if (place_meeting(x,y+spd[1],obj_ad_wall)) {
	y = round(y);
	while(!place_meeting(x,y+sign(spd[1]),obj_ad_wall)) {
		y += sign(spd[1]);
	}
	spd[1] = 0;
} else {
	y += spd[1];
}