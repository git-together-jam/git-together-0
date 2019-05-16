



	var _size = 2;
	part_type_color3(PSYSTEM_PULSE, c_red, c_red, c_red);
	part_emitter_region( PSYSTEM, PSYSTEM_EMITTER_1, x - _size, x + _size, y - _size, y + _size, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst( PSYSTEM, PSYSTEM_EMITTER_1, PSYSTEM_PULSE, 20);	