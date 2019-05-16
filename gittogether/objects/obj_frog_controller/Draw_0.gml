draw_set_font(fnt_pixel);
draw_set_halign(fa_left);
draw_set_color(c_white);
if (!is(room,rm_frogger_user,rm_frogger_highscore)) draw_text(10,10,"Time: "+frog_seconds_to_time_string(global.froggerTime/room_speed,false))