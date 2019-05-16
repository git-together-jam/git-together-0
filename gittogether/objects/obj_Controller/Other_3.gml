<<<<<<< HEAD
/// @description Game finished

// Save global variables to Save System
sys_save_global_write("Coins",global.Coins);
sys_save_global_write("Games Won",global.GamesWon);

// Save to disk
sys_save_disk_write();

// Free
=======
/// @description Game finished

// Save global variables to Save System
sys_save_global_write("Coins",global.Coins);
//sys_save_global_write("Tickets",global.Tickets);
//sys_save_global_write("CheatsUsed",global.CheatsUsed);

// Save to disk
sys_save_disk_write();

// Free Memory
>>>>>>> parent of c7ecc3e... Tracks winning
_sys_save_destroy();