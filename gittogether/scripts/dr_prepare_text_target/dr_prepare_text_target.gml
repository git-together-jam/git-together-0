/// @desc inserts newlines in dialogue string for Dungandrompa
/// @arg string
/// @arg width

var _str = argument0;
var _width = argument1;
var _len = string_length(_str);
var _str_new = "";
var _last_newline_index = 0;

// TODO: skip drawing newline time

for (var i = 1; i <= _len; i++) {
	var _chr = string_char_at(_str, i);
	if (string_width(_str_new + _chr) > _width) {
		for (var j = string_length(_str_new); j > _last_newline_index; j--) {
			if (string_char_at(_str_new, j) == " ") {
				_str_new = string_set_byte_at(_str_new, j, ord("\n"))
				_last_newline_index = j;
				break;
			}
		}
	}
	_str_new += _chr;
}

return _str_new;