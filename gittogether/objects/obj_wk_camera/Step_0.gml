//camera handler for my game
// Thanks yosi, you made my work a lot easier :D

var _section_width =  960;
var _section_height = 528;

var _x_pass = 16
var _y_pass = 32

var _cam_w = camera_get_view_width (view_camera[0])
var _cam_h = camera_get_view_height (view_camera[0])

var _cam_x = obj_wk_viking.x - (_cam_w / 2);
var _cam_y = obj_wk_viking.y - (_cam_h / 2);



_cam_x = clamp(_cam_x, ((_section_width + _cam_w)  * sectionx), (((_section_width + _cam_w) * sectionx) + _section_width))
_cam_y = clamp(_cam_y, (-(((_section_height + _cam_h) * sectiony) + _section_height)), (-(((_section_height + _cam_h) * sectiony))))

_cam_x = lerp(camera_get_view_x(view_camera[0]), _cam_x, 0.08)
_cam_y = lerp(camera_get_view_y(view_camera[0]), _cam_y, 0.08)

camera_set_view_pos(view_camera[0], _cam_x, _cam_y);

var _min_x = (((_section_width + _cam_w) * sectionx) -_x_pass)
var _max_x = (((_section_width + _cam_w) * sectionx) + _section_width + _cam_w + _x_pass)

var _max_y = (-((_section_height + _cam_h) * sectiony + _section_height + _y_pass))
var _min_y = (-((_section_height + _cam_h) * sectiony  - _cam_h - _y_pass))

if (!point_in_rectangle(obj_wk_viking.x, obj_wk_viking.y, _min_x, _min_y, _max_x, _max_y)){
	if (obj_wk_viking.x < _min_x) {
		sectionx -= 1
	}
	if (obj_wk_viking.x > _max_x) {
		sectionx += 1
	}
	if (obj_wk_viking.y > _min_y) {
		sectiony -=1
	}
	if (obj_wk_viking.y < _max_y) {
		sectiony +=1
	} 
}