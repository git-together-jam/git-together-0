
if (dialogue_index < dialogue_count - 1) {
	
	var _soffr = round(seat_offset);
	for (var i = _soffr - 1; i < _soffr + 2; i++) {
		var _index = (i + seat_count) % seat_count;
		var _char = characters[? seat[_index]];
		draw_sprite_ext(
			_char[? "sprite"], 0, 
			i * seat_width - seat_offset * seat_width - lengthdir_x(seat_len, seat_dir + seat_angle) + seat_width / 2 + (room_width - seat_width) / 2, 
			-lengthdir_y(seat_len, seat_dir + seat_angle) + room_height / 2,
			1, 1,
			seat_angle,
			c_white, 1
		);
	}
	
	var _dial = dialogue[| dialogue_index];
	var _char = characters[? _dial[? "name"]];
	
	if (_char != undefined) {
		draw_set_font(text_font);

		var _full_name = _char[? "full_name"];
		draw_rect(0, room_height * .8 - text_height - text_name_padding * 2, text_padding * 2 + string_width(_full_name), room_height * .79, $100005, .6);
		draw_text(text_padding, room_height * .79 - text_height - text_name_padding, _full_name);
		if (_dial[? "status"] == "self") draw_set_color($f18746);
	}
}

var _x = text_padding;
var _y = room_height * .8;

if (_dial[? "status"] == "event") {
	var _last = text_list[| ds_list_size(text_list) - 1];
	_x = (1 - event_timer / event_time) * room_width * .5;
	var _sin = sin((event_timer / event_time) * pi);
	draw_set_alpha(min(_sin * 2.3, 1));
	_y = (room_height - _last[? "y"] - text_height) / 2;
	
	draw_rect(0, room_height * .5 - _sin * text_height, room_width, room_height * .5 + _sin * text_height, $100205, .6);
} else {
	draw_rect(0, room_height * .79, room_width, room_height, $100205, .6);
}

var _len = 0;
var _size = ds_list_size(text_list);
for (var i = 0; i < _size; i++) {
	var _text = text_list[| i];
	var _str  = _text[? "text"];
	var _ilen = string_length(_str);
	
	if (_len + _ilen > text_length) {
		_str = string_copy(_str, 0, text_length - _len);
		_size = 0; // to break early, but after iteration
	}
	_len += _ilen;

	draw_text(_x + _text[? "x"], _y + _text[? "y"], _str);
}
draw_set_color($ffffff);
draw_set_alpha(1);