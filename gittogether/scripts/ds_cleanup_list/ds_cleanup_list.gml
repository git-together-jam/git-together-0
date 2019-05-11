/// @func ds_cleanup_list(list)
/// @arg list		data structure id

gml_pragma("forceinline");
if (ds_exists(argument0, ds_type_list)) ds_list_destroy(argument0);