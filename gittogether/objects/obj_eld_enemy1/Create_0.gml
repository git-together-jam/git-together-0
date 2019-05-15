/// @description Insert description here
// You can write your code in this editor

enum ELDEnemyState {
	Tracking,
	Formation,
	Breakaway
}
image_xscale = 0.5;
image_yscale = 0.5;

posIndex = 0; // where the enemy ends up, once the track is complete

// the track positions
targets = []; //ds_list_create();
// where on the track we are headed toward
trackIndex = 0;

state = 0;

//ds_list_add(targets, [x+30, y+50]);
//ds_list_add(targets, [x, y]);