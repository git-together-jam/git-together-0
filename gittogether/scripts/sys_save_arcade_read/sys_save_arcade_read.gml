/// @func sys_save_global_write
/// @arg name
/// @arg key
/// @arg value

var _map = ds_map_find_value(global.SaveSystem,argument0);
var _result = ds_map_find_value(_map,argument1);

if is_undefined(_result) _result = argument2;

return _result;