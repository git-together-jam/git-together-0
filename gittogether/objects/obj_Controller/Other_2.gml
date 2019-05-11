/// @description 
// Resolution
window_set_size(RES_W*RES_S, RES_H*RES_S);
surface_resize(application_surface, RES_W*RES_S, RES_H*RES_S);

window_set_position(display_get_width()/2-(RES_W*RES_S)/2, display_get_height()/2-(RES_H*RES_S)/2);
display_set_gui_size(RES_W, RES_H);

room_goto_next();