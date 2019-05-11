
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

draw_rect(0, room_height * .79, room_width, room_height, $100205, .6);
draw_text_ext(text_padding, room_height * .8, text, text_height + 2, room_width);
draw_set_color($ffffff);