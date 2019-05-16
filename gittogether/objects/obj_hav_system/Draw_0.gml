


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
draw_text( room_width - 20, 30, "SNAKE");
draw_set_font( fnt_pixel);
draw_text( room_width - 20, 50, "This snake eats duckies!");


