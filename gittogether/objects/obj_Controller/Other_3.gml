<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of b12ad90... Merge pull request #39 from meseta/Sahaun
/// @description Game finished

// Save global variables to Save System
sys_save_global_write("Coins",global.Coins);
<<<<<<< HEAD
sys_save_global_write("Games Won",global.GamesWon);
=======
sys_save_global_write("Tickets",global.Tickets);
//sys_save_global_write("CheatsUsed",global.CheatsUsed);
>>>>>>> parent of b12ad90... Merge pull request #39 from meseta/Sahaun

// Save to disk
sys_save_disk_write();

<<<<<<< HEAD
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
=======
// Free Memory
>>>>>>> parent of b12ad90... Merge pull request #39 from meseta/Sahaun
_sys_save_destroy();