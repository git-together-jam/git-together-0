/// @func sys_save_get_map
/// @arg [arcade]

/*
Returns: ds_map or undefined.
*/

var _arcade = "";

if argument_count == 1 {
	_arcade = argument[0];	
}

var _map;

// Check for Optional Argument
if _arcade != "" {
	_map = ds_map_find_value(global.SaveSystem,_arcade);
} else _map = ds_map_find_value(global.SaveSystem,"Global");

if !ds_exists(_map,ds_type_map) _map = undefined;

return _map;