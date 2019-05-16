


var _x = hGRID_X_OFF;
var _y = hGRID_Y_OFF;

for( var k = 0; k < hGRID_CELLS_W; k++){
	
	for( var j = 0; j < hGRID_CELLS_H; j++){
		
		//draw_circle( _x + ( k * hGRID_CELL_S), _y + ( j * hGRID_CELL_S), 10, false);		
		draw_sprite( spr_hav_grid_cell, 0, _x + ( k * hGRID_CELL_S), _y + ( j * hGRID_CELL_S));
		
	}	
	
}

draw_set_halign( fa_right);
draw_set_valign( fa_center);

draw_set_font( fnt_big);
draw_text( room_width - 10, 30, "SNAKE");
draw_set_font( fnt_pixel);
draw_text_transformed( room_width - 10, 40, "...the hungry snake approaches!", 0.5, 0.5, 0);

draw_text_transformed( room_width - 10, 60, "Eat 70 duckies to win!", 0.8, 0.8, 0);

var _score = string_replace_all( string_format( 70 - my_score, 2, 0), " ", "0");
draw_set_font( fnt_normal);
draw_text( room_width - 10, 100, "Duckies left: " + _score);

draw_set_font( fnt_pixel);
draw_text( room_width - 20, 150, "Turn Time: " + string( TURN_TIME));
