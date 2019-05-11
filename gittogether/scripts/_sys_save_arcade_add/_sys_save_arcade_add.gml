/// @func _sys_save_arcade_add
/// @arg name_of_arcade

/*
Underlying function. Please leave as it is. 
Unless you know what you're doing!
*/

if is_undefined(ds_map_find_value(global.SaveSystem,argument0)) {
	ds_map_add_map(global.SaveSystem,argument0,ds_map_create());	
}