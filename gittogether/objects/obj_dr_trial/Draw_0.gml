
#region Characters

var _tsurf_color = c_white;

if (dialogue_index < dialogue_count - 1) {
	
	var _soffr = round(seat_offset);
	for (var i = _soffr - 1; i < _soffr + 2; i++) {
		var _index = (i + seat_count) % seat_count;
		var _char = characters[? seat[_index]];
		draw_sprite_ext(
			_char[? "sprite"], 0, 
			i * seat_width - seat_offset * seat_width - lengthdir_x(seat_len, seat_dir + seat_angle) + seat_width / 2 + (room_width - seat_width) / 2, 
			-lengthdir_y(seat_len, seat_dir + seat_angle) + room_height / 2,
			1, 1,
			seat_angle,
			c_white, 1
		);
	}
	
	var _dial = dialogue[| dialogue_index];
	var _char = characters[? _dial[? "name"]];
	
	if (_char != undefined) {
		draw_set_font(text_font);
		
		var _y = room_height * .79 - text_height - text_name_padding;
		
		if (dialogue_state == 2) {
			var _h = nsd_bullet_height;
			_y = room_height - _h * 2 - _h * ds_list_size(nsd_bullets);
		}

		var _full_name = _char[? "full_name"];
		draw_rect(
			0, _y - text_name_padding - 1, 
			text_padding * 2 + string_width(_full_name), 
			_y + text_height + text_name_padding, 
			$100005, .6
		);
		draw_text(text_padding, _y, _full_name);
		if (_dial[? "status"] == "self") _tsurf_color = $f18746;
	}
}

#endregion;

#region Bullets

if (dialogue_state == 2) {
	draw_set_font(text_font);
	var _size = ds_list_size(nsd_bullets);
	var _h = nsd_bullet_height;
	var _sw = sprite_get_width(spr_dr_bullet);
	for (var i = 0; i < _size; i++) {
		var _bullet = nsd_bullets[| i];
		var _str = _bullet[? "name"];
		var _w = string_width(_str);
		var _ihover = nsd_bullet_selected == i;
		
		var _x = 4 + _ihover * 4 + min((nsd_timer - (((_size - i + 2) % _size) * 1.4 + 1) * nsd_bullet_out_time) / nsd_bullet_out_time, 0) * _w;
		var _y = room_height - 4 - ((_size - i + 2) % _size) * _h - text_padding;
		
		draw_sprite(spr_dr_bullet, 0, _x, _y);	
		draw_sprite_ext(
			spr_dr_bullet, 1, _x + 4, _y, 
			(_w) / _sw, 1, 0, c_white, 1
		);
		draw_sprite(spr_dr_bullet, 2, _x + _w + 4, _y);
		draw_text_col(_x + 4, _y + 2, _str, _ihover ? $25C8ff : $ffffff);
	}
}

#endregion;

#region Text Background and Text Surface Variables

var _tsx = text_padding;
var _tsy = room_height * .8;
var _tsang = 0;
var _tssiz = 1;

if (_dial[? "status"] == "event") { #region	Event Background
	
	var _last = text_list[| ds_list_size(text_list) - 1];
	_tsx = (1 - event_timer / event_time) * room_width * .5 + room_width * .125;
	var _sin = sin((event_timer / event_time) * pi);
	draw_set_alpha(min(_sin * 2.3, 1));
	_tsy = (room_height - _last[? "y"] - text_height) / 2;
	
	draw_rect(0, room_height * .5 - _sin * text_height, room_width, room_height * .5 + _sin * text_height, $100205, .6);
	
#endregion;
} else if (dialogue_state == 2) {	#region	NSD Text Variables
	
	_tsx   =  lerp(nsd_start_x,    nsd_end_x, 1 - event_timer / event_time) - min(string_width(_dial[? "text"]), room_width - text_padding * 2) / 2;
	_tsy   =  lerp(nsd_start_y,    nsd_end_y, 1 - event_timer / event_time);
	_tsang = (lerp(nsd_start_ang,  nsd_start_ang + angle_difference(nsd_start_ang, nsd_end_ang), 1 - event_timer / event_time) + 360) % 360;
	_tssiz =  lerp(nsd_start_size, nsd_end_size, 1 - event_timer / event_time);

#endregion;
} else {							#region	Default Text Background		
	
	draw_rect(0, room_height * .79, room_width, room_height, $100205, .6);
	
#endregion;
}

#endregion;

#region Text Surface

var _floating = dialogue_state == 2 && _dial[? "status"] != "event";
var _len = 0;
var _size = ds_list_size(text_list);
draw_set_font(_dial[? "status"] == "nsd" ? nsd_font : text_font);
text_surf = surface_clear_set(text_surf, room_width - text_padding * 2, room_height * .2, c_black, 0);
for (var i = 0; i < _size; i++) {
	var _text = text_list[| i];
	var _str  = _text[? "text"];
	var _ilen = string_length(_str);
	
	if (_len + _ilen > text_length) {
		_str = string_copy(_str, 0, text_length - _len);
		_size = 0; // to break early, but after iteration
	}
	_len += _ilen;
	
	var _col = _text[? "bulletpoint"] != undefined ? $21c1f2 : _tsurf_color;
	var _tx = _text[? "x"];
	var _ty = _text[? "y"];
	if (_floating) draw_rect(_tx, _ty, _tx + string_width(_str), _ty + nsd_height, c_black, .7);
	draw_text_col(_tx + _floating, _ty + _floating, _str, _col);
}																					 
surface_reset_target();
draw_set_color($ffffff);
draw_set_alpha(1);
draw_set_halign(fa_left);

draw_surface_ext(
	text_surf, 
	_tsx, _tsy,
	_tssiz, _tssiz,
	_tsang, c_white, 
	_floating ? min(sin((1 - event_timer / event_time) * pi) * 62, 1) : 1
);

#endregion;

#region Cursor

// var _text_hover = text_list[| nsd_hover];

var _spr = dialogue_state == 2 ? spr_dr_nsd_cursor : spr_dr_cursor
var _offx = sprite_get_xoffset(_spr);
var _offy = sprite_get_yoffset(_spr);
cursor_surf = surface_clear_set(cursor_surf, 32, 32, c_black, 0);
draw_sprite_ext(_spr, 0, _offx, _offy, 1, 1, 360 - (nsd_hover_timer / nsd_hover_time) * 45, c_white, 1);
if (dialogue_state == 2) draw_sprite_ext(_spr, 1, _offx, _offy, 1, 1, ((timer / room_speed) % 1) * 90 * (1 - (nsd_hover_timer / nsd_hover_time)), c_white, 1);
surface_reset_target();
draw_surface_ext(
	cursor_surf, 
	(nsd_shoot_timer > 0 ? nsd_shoot_x : mouse_x + cursor_offx) - _offx - (nsd_hover_timer / nsd_hover_time) * 4,
	(nsd_shoot_timer > 0 ? nsd_shoot_y : mouse_y + cursor_offy) - _offy - (nsd_hover_timer / nsd_hover_time) * 4,
	1 + (nsd_hover_timer / nsd_hover_time) * .2, 
	1 + (nsd_hover_timer / nsd_hover_time) * .2, 
	0, 
	merge_color($25C8ff, $0050ff, (nsd_hover_timer / nsd_hover_time)), 
	1
);

#endregion;

#region Hit Bubble

var _max = room_speed * .7;
if (nsd_hit_timer >= 0 && nsd_hit_timer < _max) {
	
	var _vcount = 64;
	var _width = nsd_hit_timer * .9 + 15;
	var _rad = nsd_hit_timer * 1.2;
	
	draw_primitive_begin(pr_trianglestrip);
	
	for (var i = 0; i <= _vcount; i++) {
		
		var _ldx = lengthdir_x(1, (i / _vcount) * 360);
		var _ldy = lengthdir_y(1, (i / _vcount) * 360);
		
		draw_vertex_color(
			nsd_shoot_x + _ldx * (_rad),
			nsd_shoot_y + _ldy * (_rad),
			$f713f3, 
			.7 - (nsd_hit_timer + 18) / _max
		);
		
		draw_vertex_color(
			nsd_shoot_x + _ldx * (_rad + _width),
			nsd_shoot_y + _ldy * (_rad + _width),
			$a569f4,
			.7 - nsd_hit_timer / _max
		);
	}
	
	draw_primitive_end();
}

#endregion;

#region Hit Counter Window

var _min = room_speed * .5;
if (nsd_hit_timer > _min && nsd_hit_timer < _min + room_speed * 2) {
	draw_sprite(
		spr_dr_counter_tonystr, 0, 
		340 - min((nsd_hit_timer - _min) / (room_speed * .2), 1) * 340 - 
		((nsd_hit_timer - _min) / (room_speed)) * 16 -
		clamp((nsd_hit_timer - _min - room_speed * 1.3) / (room_speed * .3), 0, 1) * 340, 
		sin((nsd_hit_timer / (room_speed * .045)) * pi) * 1.4
	);	
}

#endregion;

#region Counter

if (nsd_shoot_timer > 0) {
	
	var _frac = nsd_shoot_timer / nsd_shoot_time;
	var _swidth = sprite_get_width(spr_dr_counter);
	var _x = nsd_shoot_x;
	var _y = nsd_shoot_y;
	
	shader_set(shd_dr_counter);
	var _tex = sprite_get_texture(spr_dr_counter, 0);
	shader_set_uniform_f_array(nsd_uni_uvs, texture_get_uvs(_tex));
	shader_set_uniform_f(nsd_uni_offx, (1 - _frac) * _swidth * texture_get_texel_width(_tex));
	draw_sprite_ext(
		spr_dr_counter, 0, 
		_x, _y, // - sprite_get_height(spr_dr_counter) / 2,
		1, 2.8, 340,
		c_white, 1
	);
	shader_reset();
}

#endregion;