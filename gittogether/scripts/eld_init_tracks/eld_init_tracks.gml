var full_init = variable_global_exists("ELDTrackMap") == false;

if (full_init)
	global.ELDTrackMap = ds_map_create();

var _track_layers = [
	"T00",
	"T01",
	"T02",
	"T03",
	"T04",
	"T05",
	"T06",
	"T07",
	"D00",
	"D01",
	"D02",
	"D03"
];

var _num_tracks = array_length_1d(_track_layers);

for (var t = 0; t < _num_tracks; ++t)
{
	var _layer = layer_get_id(_track_layers[t]);
	if (full_init)
	{
		var _elems = layer_get_all_elements(_layer);
		var _num_elems = array_length_1d(_elems);
		var _track = array_create(_num_elems);
		for (var e = 0; e < _num_elems; ++e)
		{
			_track[e] = [ 
				layer_sprite_get_x( _elems[e] ),
				layer_sprite_get_y( _elems[e] )
			];
		}
		global.ELDTrackMap[? _track_layers[t]] = _track;	
	}
	layer_set_visible(_layer, false);
}