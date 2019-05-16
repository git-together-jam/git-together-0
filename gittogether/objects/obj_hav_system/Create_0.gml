

#macro hGRID_CELLS_W 20
#macro hGRID_CELLS_H 17
#macro hGRID_CELL_S 10
#macro hGRID_X_OFF 5
#macro hGRID_Y_OFF 5

#macro hGAME_GRID global.havgg
hGAME_GRID = ds_grid_create( hGRID_CELLS_W, hGRID_CELLS_H);
#macro hSNAKE_LIST global.havsl
hSNAKE_LIST = ds_list_create();

snake_seg = 0;



//repeat(4) {
//	hav_add_seg();
//}


enum hWorld { Void, Snake, Eat };
ds_grid_clear( hGAME_GRID, hWorld.Void);



#macro SNAKE_LIST global.sl
SNAKE_LIST = ds_list_create();
#macro DIR_LIST global.dr
DIR_LIST = ds_list_create();
enum hDirection { Right, Up, Left, Down }



#macro hCONTROL_BLOCK global.havcon
hCONTROL_BLOCK = noone;

hold = false;

new_direction = hDirection.Up;
	
//var _cs = 65;
//var _buff = 15;
var starting_x = hGRID_X_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 5, 15)) - 1;
var starting_y = hGRID_Y_OFF + ( hGRID_CELL_S / 2) + ( hGRID_CELL_S * irandom_range( 5, 12)) - 1;


with( instance_create_layer( starting_x, starting_y, "snake", obj_hav_snake)){	
}
with( instance_create_layer( starting_x, starting_y + hGRID_CELL_S, "snake", obj_hav_snake)){				
}
with( instance_create_layer( starting_x, starting_y + ( hGRID_CELL_S * 2), "snake", obj_hav_snake)){	
}
with( instance_create_layer( starting_x, starting_y + ( hGRID_CELL_S * 3), "snake", obj_hav_snake)){	
}


ds_list_add( DIR_LIST, hDirection.Up);
repeat( ds_list_size( SNAKE_LIST) - 1){
	ds_list_add( DIR_LIST, hDirection.Up);
}
			
#macro TURN_TIME_BASE 4
#macro TURN_TIME global.tt
TURN_TIME = room_speed / TURN_TIME_BASE;	
			
			