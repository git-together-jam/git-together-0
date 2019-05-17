


draw_set_halign( fa_center);
draw_set_valign( fa_center);

draw_set_alpha( alpha);
draw_set_color( hav_WHITE);
draw_text_transformed( x + xo + 1, y + yo + 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo - 1, y + yo - 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo + 1, y + yo - 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo - 1, y + yo + 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo + 1, y + yo + 0, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo - 1, y + yo - 0, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo + 0, y + yo - 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo - 0, y + yo + 1, string( my_text), scale, scale, 0);
draw_text_transformed( x + xo, y + yo, string( my_text), scale, scale, 0);
draw_set_color( hav_BLACK);
draw_text_transformed( x + xo, y + yo, string( my_text), scale, scale, 0);
draw_set_alpha( 1.0);

//show_debug_message( string( my_text));