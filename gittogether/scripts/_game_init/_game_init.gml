gml_pragma("global", "_game_init()");

// Arcade types (Each arcade is a minigame)
enum Arc {
	none,
	basic1,
	dungandrompa,
	asteroids
}

// Make sure to add the array entries for your arcade game

arcade_game_add(Arc.none, "<NONE>", spr_arcade, rm_Overworld);

arcade_game_add(Arc.basic1, "Basic 1", spr_ArcadeBasic1, rm_B1_Main);
arcade_game_add(Arc.dungandrompa, "Dungandrompa", spr_arcade_dungandompa, rm_dungandrompa);
arcade_game_add(Arc.asteroids, "Asteroids", spr_arcade_asteroids, rm_Asteroids);