/// @description Insert description here
// You can write your code in this editor
/*var _section_width = 320;
var _section_height = 176;
var _start_x = 0;
var _start_y = 5 * _section_height;
var _end_x = 5 * _section_width;
var _end_y = _section_height;
var _cam_x = obj_ad_player.x - (camera_get_view_width (view_camera[0]) / 2);
var _cam_y = obj_ad_player.y - (camera_get_view_height(view_camera[0]) / 2);
for(var i = _start_x; i < _end_x; i += _section_width) {
    for(var m = _start_y; m < _end_y; m += _section_height) {
        //calculate player section
        if (point_in_rectangle(obj_ad_player.x, obj_ad_player.y, i, m, i + _section_width, m + _section_height)) {
            _cam_x = i;
            _cam_y = m;
            break;
        }
    }
}*/

if !point_in_rectangle(obj_ad_player.x,obj_ad_player.y,camx,camy,camx+320,camy+176){
	if point_in_rectangle(obj_ad_player.x,obj_ad_player.y,camx,camy-176,camx+320,camy){
		camy=camy-176 //up
	}
	if point_in_rectangle(obj_ad_player.x,obj_ad_player.y,camx-320,camy,camx,camy+176){
		camx=camx-320 //left
	}
	if point_in_rectangle(obj_ad_player.x,obj_ad_player.y,camx,camy+176,camx+320,camy+352){
		camy=camy+176 //down
	}
	if point_in_rectangle(obj_ad_player.x,obj_ad_player.y,camx+320,camy,camx+640,camy+176){
		camx=camx+320
	}
}

camera_set_view_pos(view_camera[0], camx, camy);