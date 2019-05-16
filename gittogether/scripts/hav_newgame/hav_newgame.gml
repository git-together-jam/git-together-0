



new_direction = hDirection.Up;
my_score = 0;
turn_time_change = 0;
TURN_TIME = max( 5.0, room_speed / (turn_time_base + turn_time_change) );	
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

ds_list_clear( notifs);
ds_list_add( notifs, 
	"Ouch that hurt!",
	"SEND BACKUP!",
	"This snake will be the end of us",
	"You'll never get us all",
	"Stop, it's pointless, you'll never win",
	"The duckie army will survive!",
	"Strike me down, I shall be-QUACK",
	"Quack me once, I'm the fool. Quack me twice.."
);


ds_list_add( DIR_LIST, hDirection.Up);
repeat( ds_list_size( SNAKE_LIST) - 1){
	ds_list_add( DIR_LIST, hDirection.Up);
}