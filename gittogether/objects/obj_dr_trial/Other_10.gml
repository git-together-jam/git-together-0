/// @desc loads dialogue

ds_list_destroy_maps(text_list);
if (dialogue_index < dialogue_count - 1) {
	var _dial = dialogue[| dialogue_index];
	log(json_encode(_dial));
	switch (_dial[? "name"]) {
		case "nsd_begin":
			nsd_begin_index = dialogue_index;
			event_time = room_speed * 5;
			event_timer = event_time;
			dialogue_state = 2;
			break;
			
		case "nsd_end":
			// dialogue_state = 0;
			dialogue_index = nsd_begin_index + 1;
			_dial = dialogue[| dialogue_index];
			text_timer = 0;
			break;
	}
	text_target_length = dr_prepare_text_target(_dial[? "text"], room_width - text_padding * 2, text_list, dialogue_state);
	
	if (dialogue_state == 2 && _dial[? "name"] != "nsd_begin") {
		event_time = (text_target_length / text_per_second) * room_speed + room_speed * .82;
		event_timer = event_time;
		text_length = text_target_length;
		
		text_nsd_type = irandom(NSDT.SIZE);
		
		nsd_start_x	   = room_width  / 2; nsd_end_x	= room_width  / 2;
		nsd_start_y	   = room_height / 2; nsd_end_y	= room_height / 2;
		nsd_start_ang  = 0; nsd_end_ang	 = 0;
		nsd_start_size = 1; nsd_end_size = 1;
		
		if (random(1) < .32) {
			nsd_start_ang = random(30) - 15;
			nsd_end_ang = random(30) - 15;
		}
		
		if (random(1) < .12) {
			nsd_start_size = random(.2) + .9;
			nsd_end_ang = random(.3) + .85;
		}
		
		switch (text_nsd_type) {
			case NSDT.SLIDE_RIGHT:
				nsd_start_x = room_width * .3 + random(room_width * .2);
				nsd_end_x = room_width * .5 + random(room_width * .2);
				break;
				
			case NSDT.SLIDE_LEFT:
				nsd_start_x = room_width * .5 + random(room_width * .2);
				nsd_end_x = room_width * .3 + random(room_width * .2);
				break;
				
			case NSDT.GROW:
				nsd_start_size = .8 + random(.2);
				nsd_end_size = 1.2 + random(.3);
				break;
			
			case NSDT.SLIDE_UP:
				nsd_start_y = room_height * .3 + random(room_height * .6);
				nsd_end_y = nsd_start_y - room_height * .14 - random(room_height * .12);
				break;
		}
	}
	//var _ls = ds_list_size(text_list);
	//log("dialogue (" + string(_ls) + "): [");
	//for (var i = 0; i < _ls; i++) {
	//	log("	", json_encode(text_list[| i]) + ( i < _ls - 1 ? "," : " "));
	//}
	//log("]");
} // else text_target = "The End";
text_length = 0;