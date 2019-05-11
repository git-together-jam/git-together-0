/// @func ds_destroy(id, type)
/// @param id
/// @param type

if (!ds_exists(argument0, argument1)) return -1;
	
switch(argument1) {
	case ds_type_grid     : ds_grid_destroy(argument0);		break;
	case ds_type_list     : ds_list_destroy(argument0);		break;
	case ds_type_map      : ds_map_destroy(argument0);		break;
	case ds_type_priority : ds_priority_destroy(argument0); break;
	case ds_type_queue    : ds_queue_destroy(argument0);	break;
	case ds_type_stack    : ds_stack_destroy(argument0);	break;
	default : break;
}