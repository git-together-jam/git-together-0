
if (dialogue_index < dialogue_count - 1) {
	
	var _soffr = round(seat_offset);
	for (var i = _soffr - 1; i <= _soffr; i++) {
		var _index = (i + seat_count) % seat_count;
		var _char = characters[? seat[_index]];
		draw_sprite(_char[? "sprite"], 0, _index * room_width - seat_offset * room_width, 0);
	}
	
	var _dial = dialogue[| dialogue_index];
	var _char = characters[? _dial[? "name"]];

	draw_set_font(text_font);

	var _full_name = _char[? "full_name"];
	draw_rect(0, room_height * .8 - text_height - text_name_padding * 2, text_padding * 2 + string_width(_full_name), room_height * .79, $100005, .6);
	draw_text(text_padding, room_height * .79 - text_height - text_name_padding, _full_name);
	if (_dial[? "status"] == "self") draw_set_color($f18746);
}

var _len = 0;
var _size = ds_list_size(text_list);
draw_rect(0, room_height * .79, room_width, room_height, $100205, .6);
for (var i = 0; i < _size; i++) {
	var _text = text_list[| i];
	var _str  = _text[? "text"];
	var _ilen = string_length(_str);
	
	if (_len + _ilen > text_length) {
		_str = string_copy(_str, 0, text_length - _len);
		_size = 0; // to break early, but after iteration
	}
	_len += _ilen;

	draw_text(text_padding + _text[? "x"], room_height * .8 + _text[? "y"], _str);
}
draw_set_color($ffffff);