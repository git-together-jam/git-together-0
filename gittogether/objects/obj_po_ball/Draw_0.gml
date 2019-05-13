///@desc Draw ball and score.

//Set draw properties
draw_set_alpha(.8);
draw_set_color(-1);
draw_set_halign(fa_middle);
draw_set_font(fnt_pixel);

//Message animation.
var _a,_y,_s;
_a = audio_sound_get_track_position(music)*pi*16/8.73;
var _y = 20-sin(_a*2);
var _s = 3-.1*cos(_a);

if finish {
	
	//Draw end message.
	if (finish==1) then draw_text_transformed(RES_W*.5,_y,"You win!",_s,_s,0);
	if (finish==2) then draw_text_transformed(RES_W*.5,_y,"You lose!",_s,_s,0);
	
	draw_set_font(fnt_big);
	draw_text(RES_W*.5,RES_H*.5,string(playerScore)+" - "+string(enemyScore));
}
else {
	
	//Draw ball.
	draw_self();
	
	//Draw ready message.
	if !start then draw_text_transformed(RES_W*.5,_y,"Ready?",_s,_s,0);

	//Draw scores.
	draw_set_font(fnt_big);
	draw_text(RES_W*.2,4,playerScore);
	draw_text(RES_W*.8,4,enemyScore);

	//Reset draw properties.
	draw_set_halign(fa_left);
	draw_set_alpha(1);

	//Draw flash for scoring.
	draw_rect(0,0,RES_W,RES_H,-1,flash*.5);
}