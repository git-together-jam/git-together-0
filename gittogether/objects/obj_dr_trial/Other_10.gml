/// @desc loads dialogue

ds_list_destroy_maps(text_list);
if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	log(json_encode(_dial));
	switch (_dial[? "name"]) {
		case "nsd_begin":
			nsd_begin_index = dialogue_index;
			event_timer = event_time;
			dialogue_state = 2;
			break;
			
		case "nsd_end":
			dialogue_state = 0;
			dialogue_index = nsd_begin_index + 1;
			_dial = dialogue[| dialogue_index];
			text_timer = 0;
			break;
	}
	text_target_length = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2, text_list, dialogue_state);
	
	var _ls = ds_list_size(text_list);
	log("dialogue (" + string(_ls) + "): [");
	for (var i = 0; i < _ls; i++) {
		log("	", json_encode(text_list[| i]) + ( i < _ls - 1 ? "," : " "));
	}
	log("]");
} // else text_target = "The End";
text_length = 0;