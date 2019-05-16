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

draw_set_font(fnt_pixel);

for (var i = 1; i <= _len; i++) {
	var _chr = string_char_at(_str, i);
	if (string_width(_str_new + _chr) > _width) {
		var _str_new_len = string_length(_str_new);
		for (var j = _str_new_len; j > _last_newline_index; j--) {
			if (string_char_at(_str_new, j) == " ") {
				
				var _map = ds_map_create();
				_map[? "text"] = string_copy(_str_new, 1, j - 1);
				_map[? "x"] = 0;
				_map[? "y"] = _y;
				_y += text_height + 2;
				ds_list_add_map(_list, _map);
				
				_str_new = string_copy(_str_new, j + 1, _str_new_len - j + 1);
				// _str_new = string_set_byte_at(_str_new, j, ord("\n"))
				_last_newline_index = j;
				break;
			}
		}
	} 
	_str_new += _chr;
}

var _map = ds_map_create();
_map[? "text"] = _str_new;
_map[? "x"] = 0;
_map[? "y"] = _y;
// _y += text_height + 2;
ds_list_add_map(_list, _map);
return _len_new;