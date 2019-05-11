// Setup the path to the file
if file_exists(SavePath) {
	sys_save_disk_read();
	
} else {
	global.SaveSystem = ds_map_create();
	ds_map_add_map(global.SaveSystem,"Global",ds_map_create());
	sys_save_global_write("Version",GM_build_date);
}
