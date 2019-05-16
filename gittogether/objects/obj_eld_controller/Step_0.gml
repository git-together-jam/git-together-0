/// @description Insert description here
// You can write your code in this editor
var _ct = current_time * 0.001;


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
		}
	}
}

// spawn fighters in subwaves
var _num_ip = ds_list_size(waves_in_progress);

for (var w = 0; w < _num_ip; ++w)
{
	var _deets = waves_in_progress[| w];
	if ( (_deets[2]-2)*0.2 + _deets[3] < _ct )
	{
		// lookup
		var _wave = waves[ _deets[0] ];
		var _subwave = _wave[ _deets[1] ];
		var _track = global.ELDTrackMap[? _subwave[1]];
		var _pos = _track[0];
		
		// create enemy
		var _inst = instance_create_layer(_pos[0], _pos[1], "Instances", obj_eld_enemy1);
		_inst.posIndex = _subwave[ _deets[2] ];
		array_copy(_inst.targets, 0, _track, 0, array_length_1d(_track));
		
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

x = initial_x + sin(current_time*0.001) * 5;

origin_x = round(x);
origin_y = round(y);
