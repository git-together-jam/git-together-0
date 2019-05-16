/// @description Insert description here
// You can write your code in this editor
var _ct = current_time * 0.001;

switch(state) {
	case ELDFuelPadState.UP:
		var _t = (_ct - state_begin_time) / 5.0; // 5 seconds to ascend
		y = lerp(room_height + 20, ELD_FUEL_PAD_HOVER_HEIGHT, _t);
		if (_t > 1.0)
		{
				y = ELD_FUEL_PAD_HOVER_HEIGHT;
				state = ELDFuelPadState.HOVER;
		}
	break;
	
	case ELDFuelPadState.HOVER:
		//////////////////////////
		// pre-existing code
		//////////////////////////
		
		if (fuel_level > ELD_FUEL_PAD_PASSIVE_DRAIN)
			fuel_level -= ELD_FUEL_PAD_PASSIVE_DRAIN;
		else {
			state_begin_time = _ct;
			state = ELDFuelPadState.DOWN;
		}
	break;
	
	case ELDFuelPadState.DOWN:
		vely += ELD_GRAVITY * 1.5; // slightly more gravity than lander 
		y += vely;
		if (y > room_height + 30)
			instance_destroy();
		//var _t = (_ct - state_begin_time) / 5.0; // 5 seconds to descend
		//y = lerp(ELD_FUEL_PAD_HOVER_HEIGHT, room_height + 20, _t);
		//if (_t > 1.0)
		//	instance_destroy();
	break;
}

//make controller
if (!instance_exists(obj_eld_controller)) instance_create_layer(0,0,"Instances",obj_eld_controller);