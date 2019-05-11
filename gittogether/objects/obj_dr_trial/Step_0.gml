
if (text_length != text_target_length && !--text_timer) {
	text += string_char_at(text_target, ++text_length);
	text_timer = text_time;
}

if (mouse_check_button_pressed(mb_left) || global.iSelect) {
	text_timer -= room_speed * .04;

	if (text_length >= text_target_length) {
		dialogue_index++;
		text = "";
		if (dialogue_index < dialogue_count - 1) {
			var _dial = dialogue[| dialogue_index];
			text_target = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2);
		} else text_target = "The End";
		text_target_length = string_length(text_target);
		text_length = 0;
		log(text_target);
	
	} else {
		text = text_target;
		text_length = text_target_length;
	}
}

if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	var _name = _dial[? "name"];
	if (_name != undefined) {
		var _char = characters[? _name];
		var _target = _char[? "seat"];
	
		if (_target - seat_offset > seat_count / 2) { // go left
			seat_offset = lerp(seat_offset, seat_offset - _target, .12);
		
		} else if (_target - seat_offset < -seat_count / 2) { // go left
			seat_offset = lerp(seat_offset, seat_offset - _target, .12);
		
		} else seat_offset = lerp(seat_offset, _target, .12);
	
		if (seat_offset < 0) seat_offset = seat_count;
		if (seat_offset > seat_count) seat_offset = 0;
	}
}