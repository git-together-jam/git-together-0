
if (text_length < text_target_length && !--text_timer) {
	//text += string_char_at(text_target, ++text_length);
	text_length++;
	text_timer = text_time;
}

if (event_timer >= 0 && --event_timer < 0) {
	dialogue_index++;
	event_user(0);
}

if ((mouse_check_button_pressed(mb_left) || global.iSelect) && event_timer < 0) {
	text_timer -= room_speed * .04;

	if (text_length >= text_target_length) {
		dialogue_index++;
		event_user(0);
	
	} else {
		text_length = text_target_length;
	}
}

if (keyboard_check_pressed(ord("M"))) {
	
	dialogue_index += 5;
	event_user(0);
}

if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	var _name = _dial[? "name"];
	var _char = characters[? _name];
	if (_char != undefined) {
		var _target = _char[? "seat"];
	
		if (_target - seat_offset > seat_count / 2) { // go left
			seat_offset = lerp(seat_offset, seat_offset - _target, .12);
		
		} else if (_target - seat_offset < -seat_count / 2) { // go left
			seat_offset = lerp(seat_offset, seat_offset - _target, .12);
		
		} else seat_offset = lerp(seat_offset, _target, .12);
	
		if (seat_offset < 0) seat_offset = seat_count;
		if (seat_offset > seat_count) seat_offset = 0;
	}
	
	if (_name == "nsd_begin") {
		seat_offset = (seat_offset - .64 / room_speed + seat_count) % seat_count;
		seat_angle = lerp(seat_angle, 32, .07);
	} else seat_angle = lerp(seat_angle, 0, .07);
}