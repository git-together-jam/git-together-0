/// @desc destroys all maps in a ds_list

var _list = argument0;
var _size = ds_list_size(_list);
for (var i = 0; i < _size; i++) {
	ds_map_destroy(_list[| i]);	
}
ds_list_clear(_list);
return _list;