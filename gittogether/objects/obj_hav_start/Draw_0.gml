



draw_set_alpha( 0.9 * alpha);

draw_set_color( c_black);
draw_roundrect_ext( 30, 50, room_width - 30, room_height - 50, 10, 10, false);



draw_set_alpha( 1.0);
draw_set_color( c_white);
draw_set_halign( fa_center);
draw_set_valign( fa_center);
draw_set_font( fnt_normal);
draw_text( room_width / 2, room_height / 2 - 10, "Press any key to start!");
draw_set_font( fnt_pixel);
draw_text( room_width / 2, room_height / 2 + 8, "Arrows/WASD to move\nEat lots of duckies to win!");

draw_set_alpha( 1.0);