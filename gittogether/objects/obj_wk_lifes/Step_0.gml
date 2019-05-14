x = camera_get_view_x(view_camera[0])
y = camera_get_view_y(view_camera[0]) + camera_get_view_height (view_camera[0])
if (obj_wk_viking.wk_life = 3) {
sprite_index = spr_wk_helm1
}
if (obj_wk_viking.wk_life = 2) {
sprite_index = spr_wk_helm2
}
if (obj_wk_viking.wk_life = 1) {
sprite_index = spr_wk_helm3
}
if (obj_wk_viking.wk_life = 0) {
sprite_index = -1
scr_wk_gameover();
}