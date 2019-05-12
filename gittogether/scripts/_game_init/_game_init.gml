gml_pragma("global", "_game_init()");

global.ArcadeMachineList = ds_list_create();

_sys_save_init(true);

// Make sure to add your game here
// arcade_game_add(type, name, arcade_machine_sprite, game_room)

// Example Arcade Game
arcade_game_add("Basic 1", spr_ArcadeBasic1, rm_B1_Main);

var _dr = arcade_game_add("Dungandrompa", spr_arcade_dungandompa, rm_dungandrompa);
arcade_game_set_transition(_dr, TransType.checkerboard, c_black);
arcade_game_set_title(_dr, fnt_big, c_white);

var _asteroids = arcade_game_add("Asteroids", spr_arcade_asteroids, rm_Asteroids);
arcade_game_set_transition(_asteroids, TransType.circle, c_black);
arcade_game_set_title(_asteroids, fnt_pixel, c_gray);

arcade_game_add("Breakout", spr_arcade_breakout, rm_BR_game);

arcade_game_add("Pong", spr_arcade_pong, rm_pong);

arcade_game_add("Frogger", spr_arcade_frogger, rm_frogger);

var _wking = arcade_game_add("Wking", spr_arcade_wking, rm_wk_menu);
arcade_game_set_transition(_wking, TransType.circle, c_white);

arcade_game_add("Yosi", spr_arcade_machine_yosi, rm_yosi);

arcade_game_add("Adventure", spr_arcade_pong, rm_ad_start);