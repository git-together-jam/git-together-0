
#region sprites

sprites = [
	spr_dr_tonystr,
	spr_dr_matharoo,
	spr_dr_pope,
	spr_dr_sahaun,
	spr_dr_yellowaf,
	spr_dr_minty
];
sprites_count = array_length_1d(sprites)
sprites_index = 0;

#endregion;

#region characters

characters = json_decode(string_concat(@'{ 
	"tony": {
		"full_name": "TonyStr",
		"sprite": ', spr_dr_tonystr, @'
	},
	"math": {
		"full_name": "Matharoo",
		"sprite": ', spr_dr_matharoo, @'
	},
	"pope": {
		"full_name": "Jon Pope",
		"sprite": ', spr_dr_pope, @'
	},
	"sahaun": {
		"full_name": "Sahaun",
		"sprite": ', spr_dr_sahaun, @'
	},
	"yellowaf": {
		"full_name": "YellowAfterlife",
		"sprite": ', spr_dr_yellowaf, @'
	},
	"minty": {
		"full_name": "YellowAfterlife",
		"sprite": ', spr_dr_minty, @'
	}
}'));

#endregion;

#region dialogue

dialogue = ds_list_create();
dialogue_index = 0;

var _file = file_text_open_read("dungandrompa_dialogue.txt");

while (!file_text_eof(_file)) {
	var _str = file_text_readln(_file);
	
	var _size = string_length(_str);
	var _name_found = false;
	var _name = "";
	var _text = "";

	for (var i = 1; i <= _size; i++) {
		var _chr = string_char_at(_str, i);
	
		if (_name_found) {
			if (_chr != "\n" && _chr != "\r") _text += _chr;
		} else {
			if (_chr == ":") {
				_name_found = true;
				i++; // skip following whitespace
			} else _name += _chr;
		}
	}
	
	var _map = ds_map_create();
	_map[? "name"] = _name;
	_map[? "text"] = _text;
	ds_list_add_map(dialogue, _map);
}

file_text_close(_file);

dialogue_count = ds_list_size(dialogue);

#endregion;

#region text

text_padding = 12;
var _dial = dialogue[| 0];
text_target = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2);
text_target_length = string_length(text_target);
text = "";
text_length = 0;
text_timer = 0;
text_time = room_speed * .02;
text_font = fnt_pixel;
text_name_padding = 4;
draw_set_font(text_font);
text_height = string_height("ASIUDH87asdhajsdnaNUi");

#endregion;

#region debug

var _ls = ds_list_size(dialogue);
log("dialogue (" + string(_ls) + "): [");
for (var i = 0; i < _ls; i++) {
	log("	", json_encode(dialogue[| i]) + ( i < _ls - 1 ? "," : " "));
}
log("]");

#endregion;