

if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	var _char = characters[? _dial[? "name"]];
	draw_sprite(_char[? "sprite"], 0, 0, 0);

	draw_set_font(text_font);

	var _full_name = _char[? "full_name"];
	draw_rect(0, room_height * .8 - text_height - text_name_padding * 2, text_padding * 2 + string_width(_full_name), room_height * .79, $100005, .6);
	draw_text(text_padding, room_height * .79 - text_height - text_name_padding, _full_name);
}

draw_rect(0, room_height * .79, room_width, room_height, $100205, .6);
draw_text(text_padding, room_height * .8, text);