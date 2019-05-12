gml_pragma("global", "_game_init()");

global.ArcadeMachineList = ds_list_create();

_sys_save_init(true);

// Make sure to add your game here
// arcade_game_add(type, name, arcade_machine_sprite, game_room)

// Example Arcade Game
var _basic = arcade_game_add("Basic 1", spr_ArcadeBasic1, rm_B1_Main);
arcade_game_set_transition(_basic, TransType.screenFade, c_black);

arcade_game_add("Dungandrompa", spr_arcade_dungandompa, rm_dungandrompa);

var _asteroids = arcade_game_add("Asteroids", spr_arcade_asteroids, rm_Asteroids);
arcade_game_set_transition(_asteroids, TransType.circle, c_black);

arcade_game_add("Breakout", spr_arcade_breakout, rm_BR_game);

arcade_game_add("Pong", spr_arcade_pong, rm_pong);

arcade_game_add("Frogger", spr_arcade_frogger, rm_frogger);

arcade_game_add("Wking", spr_arcade_wking, rm_wking_menu);

arcade_game_add("Yosi", spr_arcade_machine_yosi, rm_yosi);

arcade_game_add("Adventure", spr_arcade_pong, rm_ad_start);