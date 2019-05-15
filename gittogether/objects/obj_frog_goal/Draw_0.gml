draw_self(); 
if (special != ""){
	draw_set_font(fnt_normal);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x,frog_wave(ystart-23,ystart-27,1,0),special)
}