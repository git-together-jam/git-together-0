/// @description Game finished

// Save global variables to Save System
sys_save_global_write("Coins",global.Coins);
sys_save_global_write("Games Won",global.GamesWon);

// Save to disk
sys_save_disk_write();

// Free
_sys_save_destroy();
