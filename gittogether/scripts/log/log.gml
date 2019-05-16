/// @func log(string...)
/// @arg string...

var _out = string(argument[0]);

if (argument_count) {
	for (var i = 1; i < argument_count; i++) {
		
		var _spac = ", ";
		
		switch string_char_at(_out, string_length(_out)) {
			case "	": _spac = "";	break;
			case "(": _spac = "";	break;
			case " ": _spac = "";	break;
			case "": _spac = "";	break;
			case ",": _spac = " ";	break;
			case ":": _spac = " ";	break;
		}
		
		_out += _spac + (argument[i] == undefined ? "undefined" : string(argument[i]));
	}
}

show_debug_message(_out);