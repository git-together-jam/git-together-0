/// @func json_load(fname)
/// @arg fname

var _buff = buffer_load(argument0);
var _out = buffer_read(_buff, buffer_string);
buffer_delete(_buff);
return json_decode(_out);