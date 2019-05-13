
timer++;

if (text_length < text_target_length && text_timer_running && !--text_timer) {
	text_length++;
	text_timer = text_time;
}

if (nsd_shoot_timer > 0) {
	nsd_shoot_timer--;
	nsd_shoot_time_spent++;
	window_mouse_set(
		((nsd_shoot_x - cursor_offx) / room_width)  * window_get_width(), 
		((nsd_shoot_y - cursor_offy) / room_height) * window_get_height()
	);
} else {
	cursor_offx = cursor_off_val * sin(((timer - nsd_shoot_time_spent) * .54 / room_speed) * pi / 2) * 2;
	cursor_offy = cursor_off_val * sin(((timer - nsd_shoot_time_spent) * .54 / room_speed) * pi);
}

nsd_hover = -1;
if (dialogue_state == 2) {
	
	#region Text Hover
	
	var _dial = dialogue[| dialogue_index];
	var _x	 =  lerp(nsd_start_x,    nsd_end_x, 1 - event_timer / event_time) - min(string_width(_dial[? "text"]), room_width - text_padding * 2) / 2;
	var _y	 =  lerp(nsd_start_y,    nsd_end_y, 1 - event_timer / event_time);
	var _ang = (lerp(nsd_start_ang,  nsd_start_ang + angle_difference(nsd_start_ang, nsd_end_ang), 1 - event_timer / event_time) + 360) % 360;
	var _siz =	lerp(nsd_start_size, nsd_end_size, 1 - event_timer / event_time);	
	
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
	
		var _str_width = string_width(_str);
		var _tx = _text[? "x"];
		var _ty = _text[? "y"];
		var _len1 = point_distance( 0, 0, _tx, _ty);
		var _dir1 = point_direction(0, 0, _tx, _ty);
		var _len2 = point_distance( 0, 0, _tx + _str_width, _ty + nsd_height);
		var _dir2 = point_direction(0, 0, _tx + _str_width, _ty + nsd_height);
	
		if (point_in_rectangle_safe(
			mouse_x + cursor_offx, mouse_y + cursor_offy, 
			_x + lengthdir_x(_len1 * _siz, _dir1 + _ang),
			_y + lengthdir_y(_len1 * _siz, _dir1 + _ang),
			_x + lengthdir_x(_len2 * _siz, _dir2 + _ang),
			_y + lengthdir_y(_len2 * _siz, _dir2 + _ang)
		)) {
			nsd_hover = i;
			if (_text[? "bulletpoint"] != undefined) break;
		}
	}
	
	#endregion;
	
	#region Bullet Selection
	
	var _bswitch = global.iMoveY;
	if (_bswitch == 0) _bswitch = mouse_wheel_down() - mouse_wheel_up();
	var _size = ds_list_size(nsd_bullets);
	if (_bswitch != 0 && _bswitch != nsd_bswitch_prev) {
		nsd_bullet_selected = (nsd_bullet_selected + _size + sign(_bswitch)) % _size;
	}
	
	nsd_bswitch_prev = _bswitch;
	
	#endregion;
	
	#region Bullet Shooting
	
	if (mouse_check_button_pressed(mb_left) && nsd_shoot_timer <= 0) {
		nsd_shoot_x = mouse_x + cursor_offx;
		nsd_shoot_y = mouse_y + cursor_offy;

		nsd_shoot_timer = nsd_shoot_time;
	}
	
	#endregion;
}

nsd_hover_timer = clamp(nsd_hover_timer + (nsd_hover >= 0) * 2 - 1, 0, nsd_hover_time);

var _text = text_list[| nsd_hover];
var _bullet = nsd_bullets[| nsd_bullet_selected];
if (_bullet != undefined) log("_bullet[? \"target\"]:", _bullet[? "target"]);
if (_text != undefined) log("_text[? \"bulletpoint\"]:", _text[? "bulletpoint"]);
if (nsd_shoot_timer < nsd_shoot_time * .6 && 
	_bullet != undefined && _text != undefined &&
	_bullet[? "target"] != undefined &&
	_bullet[? "target"] == _text[? "bulletpoint"]) {

	log("you hit the right one!");
	event_timer_running = false;
	
}

if (event_timer >= 0 && event_timer_running && --event_timer < 0) {
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