///@desc Draw ball and score.

//Draw ball.
draw_self();

//Draw score.
draw_set_alpha(.5);
draw_set_font(fnt_pixel);
draw_set_color(-1);

draw_set_halign(fa_middle);

draw_text_transformed(RES_W*.2,4,playerScore,2,2,0);
draw_text_transformed(RES_W*.8,4,enemyScore ,2,2,0);

draw_set_halign(fa_left);
draw_set_alpha(1);