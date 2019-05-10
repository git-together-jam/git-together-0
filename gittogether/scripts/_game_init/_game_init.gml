gml_pragma("global", "_game_init()");

// Arcade types (Each arcade is a minigame)
enum Arc {
	basic1,
	dungandrompa,
	asteroids
}

// Make sure to add the array entries for your arcade game

global.ArcSpr[Arc.basic1] = spr_ArcadeBasic1;
global.ArcRoom[Arc.basic1] = rm_B1_Main;
global.ArcMiniName[Arc.basic1] = "Basic 1";

global.ArcSpr[Arc.dungandrompa]		 = spr_arcade_dungandompa;
global.ArcRoom[Arc.dungandrompa]	 = rm_dungandrompa;
global.ArcMiniName[Arc.dungandrompa] = "Dungandrompa";

global.ArcSpr[Arc.asteroids]	  = spr_arcade_asteroids;
global.ArcRoom[Arc.asteroids]	  = rm_Asteroids;
global.ArcMiniName[Arc.asteroids] = "Asteroids";
