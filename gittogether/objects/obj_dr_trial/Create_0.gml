
sprites = [
	spr_dr_tonystr,
	spr_dr_matharoo,
	spr_dr_pope,
	spr_dr_sahaun,
	spr_dr_yellowaf
];
sprites_count = array_length_1d(sprites)
sprites_index = 0;

var _buff = buffer_load("dungandrompa_dialogue.txt");
dialogue_raw = buffer_read(_buff, buffer_text);
buffer_delete(_buff);

dialogue = ds_list_create();

var _size = string_length(dialogue_raw);
var _name_found = false;
var _name = "";
var _text = "";

for (var i = 1; i <= _size; i++) {
	var _chr = string_char_at(dialogue_raw, i);
	
	if (_name_found) {
		if (_chr == ";") {
			
			var _map = ds_map_create();
			_map[? "name"] = _name;
			_map[? "text"] = _text;
			ds_list_add_map(dialogue, _map);
			
			_name_found = false;
			_name = "";
			_text = "";
			i += 2; // skip following whitespace
		} else _text += _chr;
	} else {
		if (_chr == ":") {
			_name_found = true;
			i++; // skip following whitespace
		} else _name += _chr;
	}
}

var _ls = ds_list_size(dialogue);
log("dialogue (" + string(_ls) + "): [");
for (var i = 0; i < _ls; i++) {
	log("	", json_encode(dialogue[| i]) + ( i < _ls - 1 ? "," : " "));
}
log("]");