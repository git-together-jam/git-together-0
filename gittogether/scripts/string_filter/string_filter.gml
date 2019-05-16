/// @desc filters string1 for characters from string2
/// @arg string1
/// @arg string2

var _st1 = argument0;
var _st2 = argument1;
var _sto = "";
var _len = string_length(_st1);

for (var i = 1; i <= _len; i++) {
	var _chr = string_char_at(_st1, i);
	if (string_pos(_chr, _st2) >= 1) _sto += _chr;	
}

return _sto;