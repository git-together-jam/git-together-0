/// @func ds_list_merge(list1, list2, [delete])
/// @arg list1
/// @arg list2
/// @arg [delete]

var _l1 = argument[0];
var _l2 = argument[1];
var _del = argument_count > 2 && argument[2];

var _len = ds_list_size(_l2);

for (var i = 0; i < _len; i++) {
	ds_list_add(_l1, _l2[| i]);	
}

if (_del) ds_list_destroy(_l2);

return _l1;