

#macro hGRID_CELL_S 10
#macro hGRID_X_OFF 5
#macro hGRID_Y_OFF 6

#macro hSNAKE_LIST global.havsl
hSNAKE_LIST = ds_list_create();

snake_seg = 0;

#macro hav_WHITE $dccbc0 // c0cbdc
#macro hav_BLACK $251418 // 181425

#macro TARGET 70

ended = false;

enum hGameState { Start, Play, Over, Win }
game_state = hGameState.Start;

instance_create_layer( 0, 0, "particles", obj_hav_start);

notifs = ds_list_create();
ds_list_add( notifs, 
	"Ouch that hurt!",
	"SEND BACKUP!",
	"This snake will be the end of us",
	"You'll never get us all",
	"Stop, it's pointless, you'll never win",
	"The duckie army will survive!",
	"Strike me down, I shall be-QUACK"
);
show_debug_message("ERE - " + string( ds_list_size( notifs)));


#macro SNAKE_LIST global.sl
SNAKE_LIST = ds_list_create();
#macro DIR_LIST global.dr
DIR_LIST = ds_list_create();
enum hDirection { Right, Up, Left, Down }


#macro hCONTROL_BLOCK global.havcon
hCONTROL_BLOCK = noone;

new_direction = hDirection.Up;
cur_direction = hDirection.Up;
	
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
			
turn_time_base = 4;
turn_time_change = 0;
#macro TURN_TIME global.tt
TURN_TIME = room_speed / turn_time_base;	
			
my_score = 0;	
			
			
#macro PSYSTEM global.ps
PSYSTEM = part_system_create_layer("particles", true);

#macro PSYSTEM_PULSE global.ps_pulse
PSYSTEM_PULSE = part_type_create();
part_type_shape(PSYSTEM_PULSE, pt_shape_square);
part_type_size(PSYSTEM_PULSE, 0.05, 0.05, 0, 0.01);
part_type_color3(PSYSTEM_PULSE, c_yellow, c_yellow, c_yellow);
part_type_alpha3(PSYSTEM_PULSE, 0.8, 1, 0);
part_type_speed(PSYSTEM_PULSE, 0.45, 0.6, -0.001, 0);
part_type_direction(PSYSTEM_PULSE, 0, 359, 0, 10);
part_type_blend(PSYSTEM_PULSE, true);
part_type_life(PSYSTEM_PULSE, 20, 35);

#macro PSYSTEM_EMITTER_1 global.psystem_emitter_1
PSYSTEM_EMITTER_1 = part_emitter_create(PSYSTEM);