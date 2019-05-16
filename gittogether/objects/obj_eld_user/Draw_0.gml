draw_set_font(fnt_big);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width/2,room_height/2-10,"GAME OVER\nEnter a Username:\n\n");

//letters
var _size = frog_wave(1.5,2,1,0);
var _defaultsize = 1.5;
if (useredit == 0)	draw_text_ext_transformed_color(room_width/2-30,	room_height/2+30,letters[userinput[0]],0,100,_size,_size,0,c_white,c_white,c_white,c_white,1);
else				draw_text_ext_transformed_color(room_width/2-30,	room_height/2+30,letters[userinput[0]],0,100,_defaultsize,_defaultsize,0,c_gray,c_gray,c_gray,c_gray,1);
if (useredit == 1)	draw_text_ext_transformed_color(room_width/2,		room_height/2+30,letters[userinput[1]],0,100,_size,_size,0,c_white,c_white,c_white,c_white,1);
else				draw_text_ext_transformed_color(room_width/2,		room_height/2+30,letters[userinput[1]],0,100,_defaultsize,_defaultsize,0,c_gray,c_gray,c_gray,c_gray,1);
if (useredit == 2)	draw_text_ext_transformed_color(room_width/2+30,	room_height/2+30,letters[userinput[2]],0,100,_size,_size,0,c_white,c_white,c_white,c_white,1);
else				draw_text_ext_transformed_color(room_width/2+30,	room_height/2+30,letters[userinput[2]],0,100,_defaultsize,_defaultsize,0,c_gray,c_gray,c_gray,c_gray,1);

if (useredit == 3)	draw_text_ext_transformed_color(room_width/2+120,	room_height/2+65,"Enter",0,200,_size/2,_size/2,0,c_white,c_white,c_white,c_white,1);
else				draw_text_ext_transformed_color(room_width/2+120,	room_height/2+65,"Enter",0,200,_defaultsize/2,_defaultsize/2,0,c_gray,c_gray,c_gray,c_gray,1);

//arrows
var _arrowoffset = frog_wave(0,7,1,0);
draw_sprite_ext(spr_frog_arrow,0,room_width/2+55+_arrowoffset,room_height/2+45,1,1,0,c_white,1);
draw_sprite_ext(spr_frog_arrow,0,room_width/2-55-_arrowoffset,room_height/2+45,-1,1,0,c_white,1);
if (useredit == 0){
	draw_sprite_ext(spr_frog_arrow,0,room_width/2-30,room_height/2+15-_arrowoffset,1,1,90,c_white,1);
	draw_sprite_ext(spr_frog_arrow,0,room_width/2-30,room_height/2+75+_arrowoffset,1,1,270,c_white,1);
}
if (useredit == 1){
	draw_sprite_ext(spr_frog_arrow,0,room_width/2,room_height/2+15-_arrowoffset,1,1,90,c_white,1);
	draw_sprite_ext(spr_frog_arrow,0,room_width/2,room_height/2+75+_arrowoffset,1,1,270,c_white,1);
}
if (useredit == 2){
	draw_sprite_ext(spr_frog_arrow,0,room_width/2+30,room_height/2+15-_arrowoffset,1,1,90,c_white,1);
	draw_sprite_ext(spr_frog_arrow,0,room_width/2+30,room_height/2+75+_arrowoffset,1,1,270,c_white,1);
}
