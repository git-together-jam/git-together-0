/// @desc loads dialogue

ds_list_destroy_maps(text_list);
if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	log(json_encode(_dial));
	text_target_length = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2, text_list, 0);
	if (_dial[? "name"] == "nsd_begin") event_timer = event_time;
} // else text_target = "The End";
text_length = 0;