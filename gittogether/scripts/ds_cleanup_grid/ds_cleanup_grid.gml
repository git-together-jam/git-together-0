/// @func ds_cleanup_grid(grid)
/// @arg grid		data structure id

gml_pragma("forceinline");
if (ds_exists(argument0, ds_type_grid)) ds_grid_destroy(argument0);