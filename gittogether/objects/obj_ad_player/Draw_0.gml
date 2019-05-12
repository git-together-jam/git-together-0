/// @description Insert description here
// You can write your code in this editor
if spd[0]=0{
	if spd[1]>0{
		image_index=2
	}
	if spd[1]<0{
		image_index=0
	}
}
if spd[1]=0{
	if spd[0]>0{
		image_index=1
	}
	if spd[0]<0{
		image_index=3
	}
}
if spd[0]>0{
	if spd[1]>0{
		image_index=5
	}
	if spd[1]<0{
		image_index=4
	}
}	
if spd[0]<0{
	if spd[1]>0{
		image_index=6
	}
	if spd[1]<0{
		image_index=7
	}
}
draw_self()