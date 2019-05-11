/// @func sys_save_disk_write
var _json = json_encode(global.SaveSystem);

_json = json_minify(_json);

var _buff = buffer_create(1,buffer_grow,1);
buffer_seek(_buff,buffer_seek_start,0);
buffer_write(_buff,buffer_string,_json);
buffer_save(_buff,SavePath);
buffer_delete(_buff);