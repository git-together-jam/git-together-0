/// @description Game finished

// Save global variables to Save System
sys_save_global_write("Coins",global.Coins);
//sys_save_global_write("Tickets",global.Tickets);
//sys_save_global_write("CheatsUsed",global.CheatsUsed);

// Save to disk
sys_save_disk_write();

// Free Memory
_sys_save_destroy();