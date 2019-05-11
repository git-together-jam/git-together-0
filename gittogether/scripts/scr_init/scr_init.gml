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
	clawMachine
}

// Make sure to add the array entries for your arcade game
// Arcade sprites
global.arcSpr[Arc.basic1] = spr_ArcadeBasic1;

// Arcade rooms
global.arcRoom[Arc.basic1] = rm_B1_Main;

// Minigame names
global.arcMiniName[Arc.basic1] = "Basic 1";

global.arcSpr[Arc.dungandrompa]		 = spr_arcade_dungandompa;
global.arcRoom[Arc.dungandrompa]	 = rm_dungandrompa;
global.arcMiniName[Arc.dungandrompa] = "Dungandrompa";


global.arcSpr[Arc.clawMachine]		 = spr_arcade_dungandompa;
global.arcRoom[Arc.clawMachine]	 = rm_CM_Main1;
global.arcMiniName[Arc.clawMachine] = "Claw Machine";
#endregion
