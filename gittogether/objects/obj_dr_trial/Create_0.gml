
event_time = room_speed * 5;
event_timer = -1;
event_timer_running = true;
timer = 0; // increments infinitely

cam_offx = 0;
cam_offy = 0;
cam_targetx = 0;
cam_targety = 0;
cam_time = room_speed * 10;
cam_timer = 0;

#region Characters

characters = json_decode(string_concat(@'{ 
	"tony": {
		"full_name": "TonyStr",
		"sprite": ', spr_dr_tonystr, @',
		"seat": 0,
		"ultimate": "Skin Creator"
	},
	"math": {
		"full_name": "Matharoo",
		"sprite": ', spr_dr_matharoo, @',
		"seat": 1,
		"ultimate": "Community Leader"
	},
	"jxm": {
		"full_name": "Juju",
		"sprite": ', spr_dr_juju, @',
		"seat": 2,
		"ultimate": "???"
	},
	"pope": {
		"full_name": "Jon Pope",
		"sprite": ', spr_dr_pope, @',
		"seat": 3,
		"ultimate": "Pope"
	},
	"sahaun": {
		"full_name": "Sahaun",
		"sprite": ', spr_dr_sahaun, @',
		"seat": 4,
		"ultimate": "Snowman"
	},
	"yellowaf": {
		"full_name": "YellowAfterlife",
		"sprite": ', spr_dr_yellowaf, @',
		"seat": 5,
		"ultimate": "Programming Wizard"
	},
	"yosi": {
		"full_name": "Yosi",
		"sprite": ', spr_dr_yosi, @',
		"seat": 6,
		"ultimate": "Code Obfuscator"
	},
	"minty": {
		"full_name": "Minty Python",
		"sprite": ', spr_dr_minty, @',
		"seat": 7,
		"ultimate": "Penguin"
	}
}'));

seat = ["tony", "math", "jxm", "pope", "sahaun", "yellowaf", "yosi", "minty"];
seat_offset = 0;
seat_count	= array_length_1d(seat);
seat_angle  = 0;
seat_len = point_distance(0, 0, room_width, room_height) / 2;
seat_dir = point_direction(0, 0, room_width, room_height);
seat_width = room_width * .7;

#endregion;

#region Dialogue

dialogue = ds_list_create();
dialogue_index = 0;
dialogue_state = 0;

var _file = file_text_open_read("dungandrompa_dialogue.txt");
// var _read_state = 0;
var _bullets = ds_list_create();
var _state_stack = ds_stack_create();
var _nsd = -1;
ds_stack_push(_state_stack, dialogue_state);

while (!file_text_eof(_file)) {
	var _str = file_text_readln(_file);
	var _str_len = string_length(_str);
	
	#region tag matchin'
	
	if (string_char_at(_str, 1) == "[" && string_char_at(_str, _str_len - 2) == "]") {
		if (string_char_at(_str, 2) == "/") {
			ds_stack_pop(_state_stack);
		}
		
		var _tag = string_copy(_str, 2, _str_len - 4);
		switch (_tag) {
			
			case "BULLETS": #region;
			
				ds_stack_push(_state_stack, 1); 
				
			break; #endregion;
				
			case "/BULLETS": #region;
			
				var _list = ds_list_create();
				ds_list_copy(_list, _bullets);
				_nsd[? "bullets"] = _list;
				ds_list_clear(_bullets);
				
			break; #endregion;
				
			case "NSD": #region;
			
				ds_stack_push(_state_stack, 2);
				var _map = ds_map_create();
				_map[? "name"] = "nsd_begin";
				_map[? "text"] = "Make your argument!";
				_map[? "status"] = "event";
				_map[? "bullets"] = -1;
				ds_list_add_map(dialogue, _map);
				
				_nsd = _map;
				
			break; #endregion;
				
			case "/NSD": #region;
			
				var _map = ds_map_create();
				_map[? "name"] = "tony";
				_map[? "text"] = choose(
					"Crap! I need to look for a flaw in their arguments",
					"There must be some contradiction in there somewhere!",
					"I have to break up this conflict somehow!",
					"Shubbadubbadingdong ping pang",
					"Maybe if I keep shut and don't say anything, they'll all go away",
					"I'm clearly always right, so I have to fix this!"
				);
				_map[? "status"] = "self";
				ds_list_add_map(dialogue, _map);
				
				var _map = ds_map_create();
				_map[? "name"] = "nsd_end";
				_map[? "text"] = "";
				_map[? "status"] = "event";
				ds_list_add_map(dialogue, _map);
			
			break; #endregion;
		}
		continue;
	}
	
	#endregion;
	
	switch (ds_stack_top(_state_stack)) {
		
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
					if (string_pos(_chr, ",0123456789") >= 1) _target += _chr;
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
			if (string_length(_target)) _bullet[? "target"] = "," + _target + ",";
			log("filtered string:", "," + _target + ",");
			ds_list_add(_bullets, _bullet);
			
	
			log("Added bullet: ", json_encode(_bullet));
			
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
			_map[? "status"] = _status != "" ? _status : "nsd";
			ds_list_add_map(dialogue, _map);
		
		break; #endregion
	}
}

ds_list_destroy(_bullets);
ds_stack_destroy(_state_stack);
file_text_close(_file);

dialogue_count = ds_list_size(dialogue);

#endregion;

#region Text

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
text_timer_running = true;
text_name_padding = 4;
text_per_second = string_length("Some of the contestants a");
text_nsd_type = 0;
text_surf = -1;

#endregion;

#region nonstop debate

// NonStop Debate Type
enum NSDT {
	SLIDE_RIGHT,
	SLIDE_LEFT,
	GROW,
	SLIDE_UP,
	SIZE
}

nsd_start_x	   = 0; nsd_end_x	 = 0;
nsd_start_y	   = 0; nsd_end_y	 = 0;
nsd_start_ang  = 0; nsd_end_ang	 = 0;
nsd_start_size = 1; nsd_end_size = 1;

nsd_font = fnt_normal;
draw_set_font(nsd_font);
nsd_height = string_height("ASD(/=ha97sudhnIPSAD");
nsd_begin_index = 0;
nsd_hover = -1;
nsd_hover_timer = 0;
nsd_hover_time = room_speed * .24;

nsd_hit_timer = -1;

nsd_timer = 0;
nsd_bullet_out_time = room_speed * .24;

last_bullet_index = 0;

nsd_bullets = ds_list_create();
nsd_bullet_height = 14;
nsd_bullet_selected = 0;
nsd_bswitch_prev = 0;

nsd_shoot_x = 0;
nsd_shoot_y = 0;
nsd_shoot_timer = 0;
nsd_shoot_time = room_speed * .47;
nsd_shoot_time_spent = 0;

nsd_uni_uvs = shader_get_uniform(shd_dr_counter, "uvs");
nsd_uni_offx = shader_get_uniform(shd_dr_counter, "offx");

#endregion;

#region Cursor

cursor_previous = window_get_cursor();
window_set_cursor(cr_none);
cursor_surf = -1;
cursor_off_val = 12;
cursor_offx = 0;
cursor_offy = 0;

#endregion;

#region Debug [x]
/*
var _ls = ds_list_size(dialogue);
log("dialogue (" + string(_ls) + "): [");
for (var i = 0; i < _ls; i++) {
	log("	", json_encode(dialogue[| i]) + ( i < _ls - 1 ? "," : " "));
}
log("]");
*/
#endregion;

// nyeh