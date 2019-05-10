gml_pragma("global", "scr_init()");

#region Resolution
#macro RES_W 320
#macro RES_H 180
#macro RES_S 4
#endregion

#region Game
// Arcade types (Each arcade is a minigame)
enum arc {
	basic1,
	dungandrompa
}

// Make sure to add the array entries for your arcade game
// Arcade sprites
global.arcSpr[arc.basic1] = spr_ArcadeBasic1;

// Arcade rooms
global.arcRoom[arc.basic1] = rm_B1_Main;

// Minigame names
global.arcMiniName[arc.basic1] = "Basic 1";

global.arcSpr[arc.dungandrompa]		 = spr_arcade_dungandompa;
global.arcRoom[arc.dungandrompa]	 = rm_dungandrompa;
global.arcMiniName[arc.dungandrompa] = "Dungandrompa";
#endregion
