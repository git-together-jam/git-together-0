gml_pragma("global", "scr_init()");

#region Resolution
#macro RES_W 320
#macro RES_H 180
#macro RES_S 4
#endregion

#region Game
// Arcade types (Each arcade is a minigame)
enum arc {
	basic1
}

// Arcade sprites
global.arcSpr[arc.basic1] = sArcadeBasic1;

// Arcade rooms
global.arcRoom[arc.basic1] = rmB1_Main;

// Minigame names
global.arcMiniName[arc.basic1] = "Basic 1";
#endregion