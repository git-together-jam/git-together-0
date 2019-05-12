/// @description Insert description here


#region define variables
//define input variables
var _xinput = (keyboard_check(vk_right)-keyboard_check(vk_left))
var _yinput = (keyboard_check(vk_up)-keyboard_check(vk_down))
#endregion
#region movement
if (_xinput!=0) and (_yinput!=0){
	spd[0]=_xinput*2/sqrt(2)
	spd[1]=_yinput*-2/sqrt(2)
} else{
	spd[0]=_xinput*2
	spd[1]=_yinput*-2
}
#endregion
#region direction handling
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
#endregion
#region attack
if keyboard_check_pressed(ord("Z")) and (canattack=1){
	alarm[0]=10
	alarm[1]=15
	canattack=0
	attack=1
	with(instance_create_layer(x,y,"Instances",obj_ad_sword))
	{
		switch (obj_ad_player.image_index){
			case 0: image_angle=0; x+=7;y-=4; break;
			case 1: image_angle=270; x+=20;y+=7; break;
			case 2: image_angle=180;x+=9;y+=20; break;
			case 3: image_angle=90; break;
			case 4: image_angle=-45; break;
			case 5: image_angle=-135; break;
			case 6: image_angle=135; break;
			case 7: image_angle=45; break;
		}
	}
}
#endregion
#region collison and application of speed
if (place_meeting(x+spd[0],y,obj_ad_wall)) {
	x = round(x);
	while(!place_meeting(x+sign(spd[0]),y,obj_ad_wall)) {
		x += sign(spd[0]);
	}
	spd[0] = 0;
} else {
	if !attack{
	x += spd[0];
	}
}
if (place_meeting(x,y+spd[1],obj_ad_wall)) {
	y = round(y);
	while(!place_meeting(x,y+sign(spd[1]),obj_ad_wall)) {
		y += sign(spd[1]);
	}
	spd[1] = 0;
} else {
	if !attack{
	y += spd[1];
	}
}
#endregion