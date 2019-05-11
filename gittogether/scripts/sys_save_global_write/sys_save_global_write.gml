/// @func sys_save_global_write
/// @arg key
/// @arg value

var _map = ds_map_find_value(global.SaveSystem,"Global");

/*
ds_map_replace is a bit magical...
It can both replace & add to a non-existing key. THATS RIGHT!
*/
ds_map_replace(_map,argument0,argument1);