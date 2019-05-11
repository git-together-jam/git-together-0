/// @func sys_save_disk_read

// Get arguments
var _clearSave = argument0;

// Load file
var _buff = buffer_load(SavePath);

// Read from file
buffer_seek(_buff,buffer_seek_start,0);
var _json = buffer_read(_buff,buffer_text);

// Free from RAM.
buffer_delete(_buff);

// Decode & turn into a ds_map
global.SaveSystem = json_decode(_json);

// Check if ds_map even exists
if global.SaveSystem = -1 {
	_sys_save_create();	
}

// Check build version and clear it
if (_clearSave) {
	if sys_save_global_read("Version",-1) != GM_build_date {
		_sys_save_clear();
	}
}