/// @func _sys_save_arcade_add
/// @arg name_of_arcade

/*
Underlying function. Please leave as it is. 
Unless you know what you're doing!
*/

if is_undefined(ds_map_find_value(global.SaveSystem,argument0)) {
	
	var _map = ds_map_create();
	
	/* 
	This will add the child map to the parent map.
	In short terms, it means that if the parent is destroyed, 
	so are the children.
	*/
	
	ds_map_add_map(global.SaveSystem,argument0,_map);
}