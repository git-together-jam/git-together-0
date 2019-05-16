


var _x = hGRID_X_OFF - 1;
var _y = hGRID_Y_OFF - 1;

//for( var k = 0; k < hGRID_CELLS_W; k++){
	
//	for( var j = 0; j < hGRID_CELLS_H; j++){
		
//		//draw_circle( _x + ( k * hGRID_CELL_S), _y + ( j * hGRID_CELL_S), 10, false);		
//		draw_sprite( spr_hav_grid_cell, 0, _x + ( k * hGRID_CELL_S), _y + ( j * hGRID_CELL_S));
		
//	}	
	
//}
draw_sprite( spr_hav_background, 0, _x, _y);

draw_set_halign( fa_right);
draw_set_valign( fa_center);

draw_set_font( fnt_big);
draw_set_color( hav_WHITE);
draw_text( room_width - 10, 27, "SNAKE");
draw_set_font( fnt_pixel);
draw_text_transformed( room_width - 10, 37, "...the hungry snake approaches!", 0.5, 0.5, 0);

//draw_text_transformed( room_width - 10, 60, "Eat 70 duckies to win!", 0.8, 0.8, 0);
draw_set_halign( fa_center);
draw_text_transformed( room_width - 58, 67, "Eat the entire duckie\narmy to win. The\nwhole world is depending\non you!", 0.8, 0.8, 0);

draw_set_halign( fa_right);
var _score = string_replace_all( string_format( TARGET - my_score, 2, 0), " ", "0");
draw_set_font( fnt_normal);
draw_text_transformed( room_width - 13, 100, "~ The Duckie Army ~", 0.8, 0.8, 0);

//draw_set_font( fnt_pixel);
//draw_text( room_width - 20, 150, "Turn Time: " + string( TURN_TIME));

var _x = 222;
var _y = 110; 
var _s = 9;

draw_set_alpha( 0.4);
	draw_roundrect_color_ext( _x - 7, _y - 7, _x + 87, _y + 60, 10, 10, c_black, c_black, false);
draw_set_alpha( 1.0);
for( var k = 0; k < 7; k++){	
	for( var j = 0; j < 10; j++){	
		if j + (k * 10) < TARGET - ( my_score) {
			draw_sprite_ext( spr_hav_duck, 0, _x + ( _s * j), _y + ( _s * k), 0.7, 0.7, 0, c_white, 1.0);		
		}
	}	
}
