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
if place_meeting(x,y+spd[1],obj_ad_wall) or place_meeting(x,y+spd[1],obj_ad_wall){
	spd[1]=0
}
if place_meeting(x+spd[0],y,obj_ad_wall) or place_meeting(x+spd[0],y,obj_ad_wall){
	spd[0]=0
}
x+=spd[0]
y+=spd[1]
