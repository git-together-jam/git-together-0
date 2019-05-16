gml_pragma("global", "_game_init()");

global.ArcadeMachineList = ds_list_create();

_sys_save_init(true);

// Make sure to add your game here
// arcade_game_add(type, name, arcade_machine_sprite, game_room)

// Basic - Noone
var _basic = arcade_game_add("Basic 1", spr_ArcadeBasic1, rm_B1_Main);
arcade_game_set_transition(_basic, TransType.screenFade, c_black);
arcade_game_enable_shader(_basic, false);

// Dungandrompa - TonyStr
var _dr = arcade_game_add("Dungandrompa", spr_arcade_dungandompa, rm_dungandrompa);
arcade_game_set_transition(_dr, TransType.checkerboard, c_black);
arcade_game_set_title(_dr, fnt_big, c_white);
arcade_game_enable_shader(_dr, true, shd_retro);

// Asteroids - Sahaun
var _ast = arcade_game_add("Asteroids", spr_arcade_asteroids, rm_Asteroids);
arcade_game_set_transition(_ast, TransType.circle, c_black);
arcade_game_set_title(_ast, fnt_normal, c_ltgray);
arcade_game_enable_shader(_ast, true, shd_retro);

// Breakout - Qweleo
var _breakout = arcade_game_add("Breakout", spr_arcade_breakout, rm_BR_game);
arcade_game_enable_shader(_breakout, true, shd_retro);

// Pong - Xor
var _pong = arcade_game_add("Pong", spr_arcade_pong, rm_pong);
arcade_game_enable_shader(_pong, true, shd_retro);

// Frogger - Andy
var _frogger = arcade_game_add("Speed Frogger", spr_arcade_frogger, rm_frogger);
arcade_game_set_title(_frogger, fnt_big, c_white);
arcade_game_enable_shader(_frogger, true, shd_retro);

// Wking - Levgon
var _wking = arcade_game_add("Wking", spr_arcade_wking, rm_wk_menu);
arcade_game_set_transition(_wking, TransType.circle, c_white);

// Yosi - Yosi
var _yosi = arcade_game_add("Yosi", spr_arcade_machine_yosi, rm_yosi);
arcade_game_enable_shader(_yosi, true, shd_retro);

// Adventure - Surg UNFINISHED!
var _adv = arcade_game_add("Adventure", spr_arcade_pong, rm_ad_start);
arcade_game_enable_shader(_adv, true, shd_retro);

// Earth's Last Defense - Naxos
var _eld = arcade_game_add("Earth's Last Defense", spr_arcade_eld, rm_eld);
arcade_game_enable_shader(_eld, true, shd_arcade);