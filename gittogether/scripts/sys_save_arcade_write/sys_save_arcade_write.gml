/// @func sys_save_arcade_write
/// @arg name
/// @arg key
/// @arg value

// Find our arcade
var _map = ds_map_find_value(global.SaveSystem,argument0);

// Check if it exists

if !is_undefined(_map) {

/*
ds_map_replace is a bit magical...
It can both replace & add to a non-existing key. THATS RIGHT!
*/
ds_map_replace(_map,argument1,argument2);	

} else show_error("Arcade doesn't exists!", true);