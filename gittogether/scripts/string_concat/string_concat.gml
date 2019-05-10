/// @desc concatinates n instances of string
/// @arg strings...

gml_pragma("forceinline");

var _str = "";
for (var i = 0; i < argument_count; i++) {
	_str += string(argument[i]);	
}
return _str;