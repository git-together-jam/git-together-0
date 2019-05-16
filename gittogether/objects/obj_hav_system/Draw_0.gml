


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
draw_text( room_width - 10, 50, "Wanna eat some duckies?\nEat 70 duckies to win!");

var _score = string_replace_all( string_format( my_score, 3, 0), " ", "0");
draw_set_font( fnt_normal);
draw_text( room_width - 10, 100, "SCORE: " + _score);

draw_set_font( fnt_pixel);
draw_text( room_width - 20, 150, "Turn Time: " + string( TURN_TIME));
