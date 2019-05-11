/// @func sys_save_global_write
/// @arg key
/// @arg value

var _map = ds_map_find_value(global.SaveSystem,"Global");
var _result = ds_map_find_value(_map,argument0);

if is_undefined(_result) _result = argument1;

return _result;