/// @func _sys_save_clear

// Get Key
var _key = ds_map_find_first(global.SaveSystem);

// Loop
while(!is_undefined(_key)) {
	// Remove Entries within Database/s
	ds_map_clear(ds_map_find_value(global.SaveSystem,_key));	
	//show_debug_message("Cleared " + string(_key));
	_key = ds_map_find_next(global.SaveSystem,_key);
}

// Add Version back in
sys_save_global_write("Version",GM_build_date);

// Report back
show_debug_message("Save file Entries cleared!");