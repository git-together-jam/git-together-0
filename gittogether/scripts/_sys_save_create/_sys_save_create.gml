/// @func _sys_save_create

// Create Save System ds_map
global.SaveSystem = ds_map_create();

// Add entry Globals to Save System
ds_map_add_map(global.SaveSystem,"Global",ds_map_create());

// Add Build Date to Global under "Version"
sys_save_global_write("Version",GM_build_date);