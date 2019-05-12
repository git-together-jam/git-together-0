///@desc Draw ball and score.

//Draw ball.
draw_self();

//Set draw properties
draw_set_alpha(.8);
draw_set_color(-1);
draw_set_halign(fa_middle);

//Draw ready message.
draw_set_font(fnt_pixel);
if !start then draw_text_transformed(RES_W*.5,20,"Ready?",3,3,0);

//Draw scores.
draw_set_font(fnt_big);
draw_text_transformed(RES_W*.2,4,playerScore,1,1,0);
draw_text_transformed(RES_W*.8,4,enemyScore ,1,1,0);

//Reset draw properties.
draw_set_halign(fa_left);
draw_set_alpha(1);

//Draw flash for scoring.
draw_rect(0,0,RES_W,RES_H,-1,flash*.5);