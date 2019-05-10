gml_pragma("global", "scr_init()");

#region Resolution
#macro RES_W 320
#macro RES_H 180
#macro RES_S 4
#endregion

#region Game
// Enemy types (Each enemy is a minigame)
// This can also be used as an arcade machine instead of an enemy if you want to go that way
// So each enemy would instead be an arcade machine
enum enm {
	basic1
}

// Enemy sprites
global.enmSpr[enm.basic1] = sEnemyBasic1;

// Enemy rooms
global.enmRoom[enm.basic1] = rmBasic1;
#endregion