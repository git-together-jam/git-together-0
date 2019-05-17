/// @desc 

if (!activated) exit;

// Draw the trophies
for (var _i = 0; _i < ds_list_size(global.GameWonList); ++_i) {
	draw_sprite(trophies[global.GameWonList[| _i]], 0, 16+24*_i, 16);
}