var _key = ds_map_find_first(global.SaveSystem);
	while(!is_undefined(_key)) {
		ds_map_clear(ds_map_find_value(global.SaveSystem,_key));	
		//show_debug_message("Cleared " + string(_key));
		_key = ds_map_find_next(global.SaveSystem,_key);
	}
sys_save_global_write("Version",GM_build_date);
show_debug_message("Save file refreshed!");