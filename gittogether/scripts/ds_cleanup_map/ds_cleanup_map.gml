/// @func ds_cleanup_map(map)
/// @arg map		data structure id

gml_pragma("forceinline");
if (ds_exists(argument0, ds_type_map)) ds_map_destroy(argument0);