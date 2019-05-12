/// @desc inserts newlines in dialogue string for Dungandrompa
/// @arg string
/// @arg width
/// @arg list
/// @arg state

var _str   = argument0;
var _width = argument1;
var _list  = argument2;
var _state = argument3;
var _len   = string_length(_str);
var _len_new = _len;
var _str_new = "";
var _last_newline_index = 1;
var _y = 0;
var _x = 0;

var _bullet_index = 0;
var _target_index = 0;
var _target_found = false;

draw_set_font(_state == 2 ? nsd_font : text_font);

for (var i = 1; i <= _len; i++) {
	var _chr = string_char_at(_str, i);
	
	if (_chr == "*") {
		if (!_target_found) {
			_target_found = true;
			_target_index = string_length(_str_new) + 1;
		} else {
			var _is_same_line = string_char_at(_str_new, _target_index) == "*";
			var _strc = _is_same_line ?
				string_copy(_str_new, _target_index + 1, string_length(_str_new) - _target_index) :
				_str_new;
			var _ls  = ds_list_size(_list);
			var _prv = _ls ? _list[| _ls - 1] : undefined;
			
			if (_is_same_line) {
				var _map = ds_map_create();
				var _strosl = string_copy(_str_new, 1, _target_index - 1)
				_map[? "text"] = _strosl;
				_map[? "x"] = _x;
				_map[? "y"] = _y;
				_x += string_width(_strosl);
				ds_list_add_map(_list, _map);
			
				_prv = _map;
				_ls++;
			}
			
			var _map = ds_map_create();
			_map[? "text"] = _strc;
			_map[? "x"] = _x;
			_map[? "y"] = _y;
			_x += string_width(_strc);
			_map[? "bulletpoint"] = _bullet_index++;
			ds_list_add_map(_list, _map);
			
			_str_new = "";
			
			_target_found = false;
			continue;
		}
	}
	
	if (string_width(_str_new + _chr) > _width) {
		var _str_new_len = string_length(_str_new);
		for (var j = _str_new_len; j > 1; j--) {
			if (string_char_at(_str_new, j) == " ") {
				
				if (_target_found) {
					if (_target_index > 1) {
						var _map = ds_map_create();
						var _str1 = string_copy(_str_new, 1, _target_index - 1);
						_map[? "text"] = _str1;
						_map[? "x"] = _x;
						_map[? "y"] = _y;
						_x += string_width(_str1);
						// _y += text_height + 2;
						// _map[? "bulletpoint"] = _bullet_index; // no increment to align with next
						ds_list_add_map(_list, _map);
					}
					
					var _map = ds_map_create();
					_map[? "text"] = string_copy(_str_new, _target_index + 1, min(_str_new_len - _target_index, j - 2));
					_map[? "x"] = _x;
					_map[? "y"] = _y;
					_y += text_height + 2;
					_x = 0;
					_map[? "bulletpoint"] = _bullet_index; // no increment to align with next
					ds_list_add_map(_list, _map);
				
					_str_new = string_copy(_str_new, j + 1, _str_new_len - j + 1);
					// _str_new = string_set_byte_at(_str_new, j, ord("\n"))
					_last_newline_index = j;
					
				} else {
					var _map = ds_map_create();
					_map[? "text"] = string_copy(_str_new, 1, j - 1);
					_map[? "x"] = 0;
					_map[? "y"] = _y;
					_y += text_height + 2;
					_x = 0;
					ds_list_add_map(_list, _map);
				
					_str_new = string_copy(_str_new, j + 1, _str_new_len - j + 1);
					// _str_new = string_set_byte_at(_str_new, j, ord("\n"))
					_last_newline_index = j;
				}
				break;
			}
		}
	} 
	_str_new += _chr;
}
	
if (string_width(_str_new)) {
	var _map = ds_map_create();
	_map[? "text"] = _str_new;
	_map[? "x"] = _x;
	_map[? "y"] = _y;
}
// _y += text_height + 2;
ds_list_add_map(_list, _map);

return _len_new;