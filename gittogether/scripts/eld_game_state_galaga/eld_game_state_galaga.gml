///@arg attractmode

var _attract_mode = argument0;

var _ct = current_time * 0.001;

if (waveState == ELDWaveState.Spawning)
{
	// spawn waves / sub waves
	if (curr_wave < array_length_1d(waves))
	{
		var _wave = waves[curr_wave];
		var _subwave = _wave[curr_subwave];

		if( _subwave[0] + start_time < _ct )
		{
			// wave, subwave, current enemy index, spawn start time
			ds_list_add(waves_in_progress, [ curr_wave, curr_subwave, 2, _ct ]);
			curr_subwave += 1;
			if (curr_subwave >= array_length_1d(_wave))
			{
				curr_wave += 1;
				curr_subwave = 0;
				waveState = ELDWaveState.Waiting;
			}
		}
	}
	else if (_attract_mode)
	{
		curr_wave = 0;
		curr_subwave = 0;
	}
	else if (!game_won and alarm[1] < 0) // no more waves, you win!
	{
		game_won = true;
		game_over = true;
		alarm[1] = room_speed * 10;
		
		var _high_score = sys_save_arcade_read(global.ELDTitle, "HighScore", 0);
		var _final_score = eld_score * (1 + obj_eld_lander.extra_lives);
		if (_final_score > _high_score)
			sys_save_arcade_write(global.ELDTitle, "HighScore", _final_score);
	}
}
else if (waveState == ELDWaveState.Waiting)
{
	if (instance_number(obj_eld_enemy1) < 1)
	{
		waveState = ELDWaveState.Spawning;
		start_time = _ct;
		fuelpads_in_wave = 2;
	}
}
	

// spawn fighters in subwaves
var _num_ip = ds_list_size(waves_in_progress);

var _spawn_delay = 0.2;
for (var w = 0; w < _num_ip; ++w)
{
	var _deets = waves_in_progress[| w];
	if ( (_deets[2]-2)*_spawn_delay + _deets[3] < _ct )
	{
		// lookup
		var _wave = waves[ _deets[0] ];
		var _subwave = _wave[ _deets[1] ];
		var _track = global.ELDTrackMap[? _subwave[1]];
		var _pos = _track[0];
		
		// create enemy
		with (instance_create_layer(_pos[0], _pos[1], "Instances", obj_eld_enemy1))
		{
			targets = [];
			posIndex = _subwave[ _deets[2] ];
			array_copy(targets, 0, _track, 0, array_length_1d(_track));
		}
		//var _inst = instance_create_layer(_pos[0], _pos[1], "Instances", obj_eld_enemy1);
		//_inst.posIndex = _subwave[ _deets[2] ];
		//array_copy(_inst.targets, 0, _track, 0, array_length_1d(_track));
		
		// book keeping
		_deets[@ 2] = _deets[2] + 1;
		if (_deets[2] >= array_length_1d(_subwave))
		{
			ds_list_delete(waves_in_progress, w);
			w -= 1;
			_num_ip -= 1;			
		}
	}
}

x = initial_x + sin(_ct) * ELD_ENEMY_SPACING;

origin_x = round(x);
origin_y = round(y);

// spawn fuel pads
if (fuelpads_in_wave > 0)
{
	if (instance_number(obj_eld_fuel_station) < 1)
	{
		--fuelpads_in_wave;
		var _inst = instance_create_layer(
						irandom_range(20, room_width-20),
						room_height + 20,
						"Instances",
						obj_eld_fuel_station
					);
		// uh... guess I don't need _inst after all.. for now XD
	}
}

// make enemies depart
if (next_departure < _ct)
{
	next_departure = _ct + random_range(1.5, 3);
	
	var _num_enemy = instance_number(obj_eld_enemy1);
	if (_num_enemy > 0)
	{
		var _inst = instance_find(obj_eld_enemy1, irandom(_num_enemy-1));
		if (_inst.state == ELDEnemyState.Formation)
		{
			_inst.state = ELDEnemyState.Breakaway;
			_inst.trackIndex = 0;
			_inst.targets = [];
			var _trackName = departTracks[ irandom_range(0, array_length_1d(departTracks)-1) ];
			var _track = global.ELDTrackMap[? _trackName];
			array_copy(_inst.targets, 0, _track, 0, array_length_1d(_track));
		}
	}
}