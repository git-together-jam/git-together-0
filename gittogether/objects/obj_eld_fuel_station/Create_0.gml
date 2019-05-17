/// @description Insert description here
// You can write your code in this editor

#macro ELD_FUEL_PAD_PASSIVE_DRAIN 0.01
#macro ELD_FUEL_PAD_HOVER_HEIGHT room_height - 16

enum ELDFuelPadState {
	UP,
	HOVER,
	DOWN
}
state = ELDFuelPadState.UP;
state_begin_time = current_time * 0.001;

//x = 30; // Controller obj will modify this in most cases
//y = room_height + 20;

image_xscale = 0.5;
image_yscale = 0.5;

tank_width = bbox_right - bbox_left - 8;

fuel_level = 100;

vely = 0;