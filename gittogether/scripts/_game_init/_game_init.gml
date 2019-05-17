gml_pragma("global", "_game_init()");

enum Game {
	clicker, dungandrompa, asteroids, breakout,
	pong, frogger, wking, yosi,
	/*adventure,*/ eld, snake, credits,
	
	length_
}

global.ArcadeMachineList = ds_list_create();

// Initialize the save system
_sys_save_init(true);

// Make sure to add your game here
// arcade_game_add(type, name, arcade_machine_sprite, game_room)

// Clicker - Noone
arcade_game_add(Game.clicker, "Clicker", spr_ArcadeBasic1, rm_B1_Main);
arcade_game_set_transition(Game.clicker, TransType.screenFade, c_black);
arcade_game_enable_shader(Game.clicker, false);

// Dungandrompa - TonyStr
arcade_game_add(Game.dungandrompa, "Dungandrompa", spr_arcade_dungandompa, rm_dungandrompa);
arcade_game_set_transition(Game.dungandrompa, TransType.checkerboard, c_black);
arcade_game_set_title(Game.dungandrompa, fnt_big, c_white);
arcade_game_enable_shader(Game.dungandrompa, true, shd_retro);

// Asteroids - Sahaun
arcade_game_add(Game.asteroids, "Asteroids", spr_arcade_asteroids, rm_Asteroids);
arcade_game_set_transition(Game.asteroids, TransType.circle, c_ltgray);
arcade_game_set_title(Game.asteroids, fnt_normal, c_dkgray);
arcade_game_enable_shader(Game.asteroids, true, shd_retro);

// Breakout - Qweleo
arcade_game_add(Game.breakout, "Breakout", spr_arcade_breakout, rm_BR_game);
arcade_game_enable_shader(Game.breakout, true, shd_retro);

// Pong - Xor
arcade_game_add(Game.pong, "Pong", spr_arcade_pong, rm_pong);
arcade_game_enable_shader(Game.pong, true, shd_retro);

// Frogger - Andy
arcade_game_add(Game.frogger, "Frogger", spr_arcade_frogger, rm_frogger);
arcade_game_set_title(Game.frogger, fnt_big, c_white);
arcade_game_enable_shader(Game.frogger, true, shd_retro);

// Wking - Levgon
arcade_game_add(Game.wking, "Wking Demo", spr_arcade_wking, rm_wk_menu);
arcade_game_set_transition(Game.wking, TransType.circle, c_white);

// Yosi - Yosi
arcade_game_add(Game.yosi, "Yosi", spr_arcade_machine_yosi, rm_yosi);
arcade_game_enable_shader(Game.yosi, true, shd_retro);

// Adventure - Surg UNFINISHED!
//arcade_game_add(Game.adventure, "Adventure", spr_arcade_pong, rm_ad_start);
//arcade_game_enable_shader(Game.adventure, true, shd_retro);

// Earth's Last Defense - Naxos
global.ELDTitle = "Earth's Last Defense";
arcade_game_add(Game.eld, global.ELDTitle, spr_arcade_eld, rm_eld);
arcade_game_set_title(Game.eld, fnt_big, c_white);
arcade_game_set_transition(Game.eld, TransType.circle, c_black);
arcade_game_enable_shader(Game.eld, true, shd_retro);
arcade_game_enable_save(Game.eld, true);

// Snake - havik
arcade_game_add(Game.snake, "Snake", spr_arcade_snake, rm_hav_snake);
arcade_game_enable_shader(Game.snake, true, shd_retro);

// Credits
arcade_game_add(Game.credits, "Credits", spr_arcade_credits, rm_credits);
arcade_game_set_transition(Game.credits, TransType.screenFade, c_black);
arcade_game_enable_shader(Game.credits, false);