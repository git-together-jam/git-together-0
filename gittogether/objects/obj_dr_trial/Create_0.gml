
#region characters

characters = json_decode(string_concat(@'{ 
	"tony": {
		"full_name": "TonyStr",
		"sprite": ', spr_dr_tonystr, @',
		"seat": 0
	},
	"math": {
		"full_name": "Matharoo",
		"sprite": ', spr_dr_matharoo, @',
		"seat": 1
	},
	"jxm": {
		"full_name": "Juju",
		"sprite": ', spr_dr_juju, @',
		"seat": 2
	},
	"pope": {
		"full_name": "Jon Pope",
		"sprite": ', spr_dr_pope, @',
		"seat": 3
	},
	"sahaun": {
		"full_name": "Sahaun",
		"sprite": ', spr_dr_sahaun, @',
		"seat": 4
	},
	"yellowaf": {
		"full_name": "YellowAfterlife",
		"sprite": ', spr_dr_yellowaf, @',
		"seat": 5
	},
	"minty": {
		"full_name": "Minty Python",
		"sprite": ', spr_dr_minty, @',
		"seat": 6
	}
}'));

seat = ["tony", "math", "jxm", "pope", "sahaun", "yellowaf", "minty"];
seat_offset = 0;
seat_count	= array_length_1d(seat);
seat_angle  = 0;
seat_len = point_distance(0, 0, room_width, room_height) / 2;
seat_dir = point_direction(0, 0, room_width, room_height);
seat_width = room_width * .7;

#endregion;

event_time = room_speed * 5;
event_timer = -1;

#region dialogue

dialogue = ds_list_create();
dialogue_index = 0;

var _file = file_text_open_read("dungandrompa_dialogue.txt");
var _read_state = 0;
var _bullets = ds_list_create();

while (!file_text_eof(_file)) {
	var _str = file_text_readln(_file);
	
	if (string_pos("[BULLETS]", _str) == 1)  { 
		_read_state = 1; 
		ds_list_destroy_maps(_bullets);
		continue;
	}
	if (string_pos("[/BULLETS]", _str) == 1) continue;
	if (string_pos("[NSD]", _str) == 1) { 
		_read_state = 2;
		var _map = ds_map_create();
		_map[? "name"] = "nsd_begin";
		_map[? "text"] = "Make your argument!";
		_map[? "status"] = "event";
		ds_list_add_map(dialogue, _map);
		continue; 
	}
	if (string_pos("[/NSD]", _str) == 1) { 
		_read_state = 0; 
		continue; 
	}
	
	switch (_read_state) {
		
		case 0: #region normal dialogue
		
			var _size = string_length(_str);
			var _name_found = false;
			var _name_found_first = false;
			var _status = "";
			var _name = "";
			var _text = "";

			for (var i = 1; i <= _size; i++) {
				var _chr = string_char_at(_str, i);
	
				if (_name_found) {
					if (_chr != "\n" && _chr != "\r") _text += _chr;
				} else {
					if (_chr == ".") {
						_name_found_first = true;
					} else if (_chr == ":") {
						_name_found = true;
						i++; // skip following whitespace
					} else if (_name_found_first) {
						_status += _chr;
					} else {
						_name += _chr;
					}
				}
			}
	
			var _map = ds_map_create();
			_map[? "name"] = _name;
			_map[? "text"] = _text;
			_map[? "status"] = _status;
			ds_list_add_map(dialogue, _map);
		
		break; #endregion;
			
		case 1: #region bullets
		
			var _size = string_length(_str);
			var _name_found = false;
			var _name = "";
			var _target = "";
			for (var i = 1; i <= _size; i++) {
				var _chr = string_char_at(_str, i);
	
				if (_name_found) {
					if (_chr == string_digits(_chr)) _target += _chr;
				} else {
					if (_chr == ":") {
						_name_found = true;
						i++; // skip following whitespace
					} else {
						_name += _chr;
					}
				}
			}
			var _bullet = ds_map_create();
			_bullet[? "name"] = _name;
			_bullet[? "target"] = string_length(_target) ? string_digits(_target) : -1;
			ds_list_add_map(_bullets, _bullet);
			
		break; #endregion;
			
		case 2: #region non-stop debate
		
			var _size = string_length(_str);
			var _name_found = false;
			var _name_found_first = false;
			var _status = "";
			var _name = "";
			var _text = "";

			for (var i = 1; i <= _size; i++) {
				var _chr = string_char_at(_str, i);
	
				if (_name_found) {
					if (_chr != "\n" && _chr != "\r") _text += _chr;
				} else {
					if (_chr == ".") {
						_name_found_first = true;
					} else if (_chr == ":") {
						_name_found = true;
						i++; // skip following whitespace
					} else if (_name_found_first) {
						_status += _chr;
					} else {
						_name += _chr;
					}
				}
			}
	
			var _map = ds_map_create();
			_map[? "name"] = _name;
			_map[? "text"] = _text;
			_map[? "status"] = _status;
			ds_list_add_map(dialogue, _map);
		
		break; #endregion
	}
}

file_text_close(_file);

dialogue_count = ds_list_size(dialogue);

#endregion;

#region text

text_padding = 12;
text_list	= ds_list_create();
var _dial	= dialogue[| 0];
text_font	= fnt_pixel;
draw_set_font(text_font);
text_height = string_height("ASIUDH87asdhajsdnaNUi");
text_target_length = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2, text_list, 0);
text_length = 0;
text_timer	= 0;
text_time	= room_speed * .02;
text_name_padding = 4;

#endregion;

#region debug

var _ls = ds_list_size(dialogue);
log("dialogue (" + string(_ls) + "): [");
for (var i = 0; i < _ls; i++) {
	log("	", json_encode(dialogue[| i]) + ( i < _ls - 1 ? "," : " "));
}
log("]");

#endregion;

// nyeh