/// @func sys_save_disk_write

// Encode ds_map to json
var _json = json_encode(global.SaveSystem);

// Use YellowAfterLife's json_* functions to make it neater
_json = json_minify(_json);
_json = json_beautify(_json);

// Create Buffer
var _buff = buffer_create(1,buffer_grow,1);

// Write Json to buffer
buffer_seek(_buff,buffer_seek_start,0);
buffer_write(_buff,buffer_text,_json);

// Save it to disk
buffer_save(_buff,SavePath);

// Free the buffer from RAM
buffer_delete(_buff);