//if (live_call()) return live_result;
/// Drawing the highscores if available
draw_set_color(c_white);
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if text == "Ready"
{
    draw_set_font(fnt_big);
	draw_text(room_width/2,30,"High Score")
	draw_set_font(fnt_pixel);
	eld_draw_text_highscore(room_width/2-95, 50, "", "Name", "Score", string(text2), player_name, c_white);
}
else
{
    draw_set_font(fnt_pixel)
	draw_text(room_width/2, room_height/2, text);
}