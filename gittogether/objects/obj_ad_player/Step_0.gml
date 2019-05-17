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
	if _moving!=1{
	if _yinput>0{
		sprite_index=spr_ad_player1
		image_index=0
		_moving=1
		//image_index=0
	}} else if _moving=1{if image_index=2{image_index=0}}
	if _moving!=2{
	if _yinput<0{
		sprite_index=spr_ad_player1
		image_index=4
		_moving=2
		//image_index=2
}} else if _moving=1 {if image_index=6{image_index=4}}
}

if _yinput=0{
	if _moving!=3{
	if _xinput>0{
		sprite_index=spr_ad_player1
		image_index=2
		_moving=3
	}} else if _moving=3{if image_index=4{image_index=2}}
	if _moving!=4{
	if _xinput<0{
		sprite_index=spr_ad_player1
		image_index=6
		_moving=4
	//	image_index=3
	}} else if _moving=4{if image_index=8{image_index=6}}
}

if _xinput>0{
	if _moving!=5{
	if _yinput>0{
		sprite_index=spr_ad_player1
		image_index=8
		_moving=5
		//image_index=4
	}} else if _moving=5{if image_index=10{image_index=8}}
	if _moving!=6{
	if _yinput<0{
		sprite_index=spr_ad_player1
		image_index=10
		_moving=6
	}} else if _moving=6{if image_index=12{image_index=10}}
}	
if _xinput<0{
	if _moving!=7{
	if _yinput>0{
		//image_index=7
		sprite_index=spr_ad_player1
		image_index=14
		_moving=7
	}} else if _moving=7{if image_index=0{image_index=14}}
	if _moving!=8{
	if _yinput<0{
		//image_index=6
		sprite_index=spr_ad_player1
		image_index=12
		_moving=8
	}} else if _moving=8{if image_index=14{image_index=12}}
}
#endregion
#region collison and application of speed
if (place_meeting(x+spd[0],y,obj_ad_wall)) {
	x = round(x);
	while(!place_meeting(x+sign(spd[0]),y,obj_ad_wall)) {
		x += sign(spd[0]);
	}
	spd[0] = 0;
		moving=0
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
	moving=0
} else {
	if !attack{
	y += spd[1];
	}
}
#endregion
#region stopping sprite at correct dir
if spd[0]=0 and spd[1]=0 and sprite_index=spr_ad_player1{
	switch floor(image_index){
		case 0:
		case 1:
			sprite_index=spr_ad_player
			image_index=0;
			break;
		case 2:
		case 3:
			sprite_index=spr_ad_player
			image_index=1;
			break;
		case 4:
		case 5:
			sprite_index=spr_ad_player
			image_index=2;
			break;
		case 6:
		case 7:
			sprite_index=spr_ad_player
			image_index=3;
			break;
		case 8:
		case 9:
			sprite_index=spr_ad_player
			image_index=4;
			break;
		case 10:
		case 11:
			sprite_index=spr_ad_player
			image_index=5;
			break;
		case 12:
		case 13:
			sprite_index=spr_ad_player
			image_index=6;
			break;
		case 14:
		case 15:
			sprite_index=spr_ad_player
			image_index=7;
			break;
	}
}
#endregion
#region attack
if keyboard_check_pressed(ord("Z")) and (canattack=1){
	alarm[0]=10
	alarm[1]=30
	canattack=0
	attack=1
	with(instance_create_layer(x,y,"Instances",obj_ad_sword))
	{
		if other.sprite_index=spr_ad_player{
			switch (obj_ad_player.image_index){
				case 0: image_angle=0; x+=7;y-=4;other._index=0;break;
				case 1: image_angle=270; x+=20;y+=7;other._index=1; break;
				case 2: image_angle=180;x+=9;y+=20;other._index=2; break;
				case 3: image_angle=90;x-=4;y+=9;other._index=3; break;
				case 4: image_angle=-45;x+=19;y-=4;other._index=4; break;
				case 5: image_angle=-135;x+=20;y+=19;other._index=5; break;
				case 6: image_angle=135;x-=3;y+=20;other._index=6; break;
				case 7: image_angle=45;x-=4;y-=3;other._index=7; break;
			}
		} else if other.sprite_index=spr_ad_player1{
			switch (floor(obj_ad_player.image_index)){
				case 0: 
				case 1:
					image_angle=0; x+=7;y-=4;other._index=0; break;
				case 2:
				case 3:
					image_angle=270; x+=20;y+=7;other._index=1; break;
				case 4:
				case 5:
				image_angle=180;x+=9;y+=20;other._index=2; break;
				case 6:
				case 7:
					image_angle=90;x-=4;y+=9;other._index=3; break;
				case 8:
				case 9:
					image_angle=-45;x+=19;y-=4;other._index=4; break;
				case 10:
				case 11:
					image_angle=-135;x+=20;y+=19;other._index=5; break;
				case 12:
				case 13:
					image_angle=135;x-=3;y+=20;other._index=6; break;
				case 14:
				case 15:
					image_angle=45;x-=4;y-=3;other._index=7; break;
			}
		}
	}
	sprite_index=spr_ad_player2
	image_index=_index
}
#endregion
if hp=0{
	room_goto_transition(rm_ad_start,TransType.screenFade,c_black,"Adventure",fnt_big,c_white)
}
