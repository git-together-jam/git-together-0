//camera handler for my game
//Be aware, sphagetty code. A levels rooms are:
//|3|4|
//|1|2|

vikingx = obj_wk_viking.x - (camera_get_view_width(view_camera[0]) / 2)
vikingy = obj_wk_viking.y - (camera_get_view_height(view_camera[0]) / 2)

if (levelroom = 1) {

vikingx = clamp(vikingx, 0, 320)
vikingy = clamp(vikingy, -176, 0)

camera_set_view_pos(view_camera[0], vikingx, vikingy);

	if (!point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, -16, -192, 656, 192)) {
		if (obj_wk_viking.y < -192 && obj_wk_viking.x > 656) {
			levelroom =  4
		} else {
			if (obj_wk_viking.y < -192) {
				levelroom =  3
			}
			if (obj_wk_viking.x > 656) {
				levelroom =  2
			}
		}
	}
}
if (levelroom = 2) {

vikingx = clamp(vikingx, 640, 960)
vikingy = clamp(vikingy, -176, 0)

camera_set_view_pos(view_camera[0], vikingx, vikingy);

if (!point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, 624, -192, 1328, 192)) {
		if (obj_wk_viking.y < -192 && obj_wk_viking.x <  624) {
			levelroom =  3
		} else {
			if (obj_wk_viking.y < -192) {
				levelroom =  4
			}
			if (obj_wk_viking.x < 624) {
				levelroom =  1
			}
		}
	} 
}
if (levelroom = 3) {

vikingx = clamp(vikingx, 0, 320)
vikingy = clamp(vikingy, -528, -352)

camera_set_view_pos(view_camera[0], vikingx, vikingy);

	if (!point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, -16, -528, 656, -160)) {
		if (obj_wk_viking.y > -160 && obj_wk_viking.x > 656) {
			levelroom =  2
		} else {
			if (obj_wk_viking.y > -160) {
				levelroom =  1
			}
			if (obj_wk_viking.x > 656) {
				levelroom =  4
			}
		}
	} 
}
if (levelroom = 4) {

vikingx = clamp(vikingx, 640, 960)
vikingy = clamp(vikingy, -528, -352)

camera_set_view_pos(view_camera[0], vikingx, vikingy);

if (!point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, 624, -528, 1328, -160)) {
		if (obj_wk_viking.y > -160 && obj_wk_viking.x <  624) {
			levelroom =  1
		} else {
			if (obj_wk_viking.y > -160) {
				levelroom =  2
			}
			if (obj_wk_viking.x < 624) {
				levelroom =  3
			}
		}
	}
}

//*/
/* -- TEST CODE --

var _section_width = 320;
var _section_height = 176;
var _start_x = 0;
var _start_y = -3 * _section_height;
var _end_x = 4 * _section_width;
var _end_y = _section_height;
var _cam_x = obj_wk_viking.x - (camera_get_view_width (view_camera[0]) / 2);
var _cam_y = obj_wk_viking.y - (camera_get_view_height(view_camera[0]) / 2);

for(var i = _start_x; i < _end_x; i += _section_width) {
	for(var m = _start_y; m < _end_y; m += _section_height) {
		//calculate player section
		if (point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, i, m, i + _section_width, m + _section_height)) {
			_cam_x = i;
			_cam_y = m;
			break;
		}
	}
}

camera_set_view_pos(view_camera[0], _cam_x, _cam_y);

//*/