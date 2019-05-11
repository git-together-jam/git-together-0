// Setup the path to the file
var _buff = buffer_load(SavePath);
buffer_seek(_buff,buffer_seek_start,0);
var _json = buffer_read(_buff,buffer_string);
buffer_delete(_buff);

global.SaveSystem = json_decode(_json);

// Check if we're out of date
if sys_save_global_read("Version",-1) != GM_build_date {
	var _key = ds_map_find_first(global.SaveSystem);
	while(!is_undefined(_key)) {
		ds_map_clear(ds_map_find_value(global.SaveSystem,_key));	
		_key = ds_map_find_next(global.SaveSystem,_key);
	}
	sys_save_global_write("Version",GM_build_date);
}