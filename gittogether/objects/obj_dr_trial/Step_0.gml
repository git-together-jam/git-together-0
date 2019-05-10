
sprites_index = (
	sprites_index + sprites_count +
	keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
) % sprites_count;

sprite_index = sprites[sprites_index];

if (text_length != text_target_length && !--text_timer) {
	text += string_char_at(text_target, ++text_length);
	text_timer = text_time;
}

if (mouse_check_button(mb_left)) {
	text_timer -= room_speed * .04;
}

if (text_length == text_target_length && mouse_check_button_pressed(mb_left)) {
	dialogue_index++;
	text = "";
	if (dialogue_index < dialogue_count) {
		var _dial = dialogue[| dialogue_index];
		text_target = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2);
	} else text_target = "The end";
	text_target_length = string_length(text_target);
	text_length = 0;
	log(text_target);
	
}