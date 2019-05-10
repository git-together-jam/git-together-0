gml_pragma("global", "scr_init()");

#region Resolution
#macro RES_W 320
#macro RES_H 180
#macro RES_S 4
#endregion

#region Game
// Arcade types (Each arcade is a minigame)
enum Arc {
	basic1,
	dungandrompa,
	asteroids
}

// Make sure to add the array entries for your arcade game

global.arcSpr[Arc.basic1] = spr_ArcadeBasic1;
global.arcRoom[Arc.basic1] = rm_B1_Main;
global.arcMiniName[Arc.basic1] = "Basic 1";

global.arcSpr[Arc.dungandrompa]		 = spr_arcade_dungandompa;
global.arcRoom[Arc.dungandrompa]	 = rm_dungandrompa;
global.arcMiniName[Arc.dungandrompa] = "Dungandrompa";

global.arc[Arc.asteroids]		  = spr_arcade_asteroids;
global.arcRoom[Arc.asteroids]	  = rm_Asteroids;
global.arcMiniName[Arc.asteroids] = "Asteroids";
#endregion
