/// @func _sys_save_init
/// @param [bool Clear Save]

// Get arguments
var _clearSave = false;

if argument_count == 1 {
	_clearSave = argument[0];	
}

if file_exists(SavePath) {
	sys_save_disk_read(_clearSave);
	
} else {
	_sys_save_create();
}
