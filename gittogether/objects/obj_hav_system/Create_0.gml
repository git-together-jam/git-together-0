

#macro hGRID_CELLS_W 20
#macro hGRID_CELLS_H 17
#macro hGRID_CELL_S 10
#macro hGRID_X_OFF 5
#macro hGRID_Y_OFF 5

#macro hGAME_GRID global.havgg
hGAME_GRID = ds_grid_create( hGRID_CELLS_W, hGRID_CELLS_H);
#macro hSNAKE_LIST global.havsl
hSNAKE_LIST = ds_list_create();

snake_seg = 0;



repeat(4) {
	hav_add_seg();
}


enum hWorld { Void, Snake, Eat };
ds_grid_clear( hGAME_GRID, hWorld.Void);


