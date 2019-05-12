/// @func draw_round_bar(x, y, radius, width, percent, [color, alpha, precision])
/// @args x,y,radius,width,percent,[color,alpha,precision]

gml_pragma("forceinline");

var _x = argument[0],
	_y = argument[1],
	_r = argument[2],
	_w = argument[3] / 2,
	_p = argument[4],
	_c = argument_count > 5 ? argument[5] : draw_get_color(),
	_a = argument_count > 6 ? argument[6] : draw_get_alpha(),
	_prec = argument_count > 7 ? argument[7] : 24,
	_end = 450 * _p;
	
draw_primitive_begin(pr_trianglestrip);

for(var i = 90; i < _end; i += _prec) {
	draw_vertex_color(
		_x + lengthdir_x( _r - _w, i), 
		_y + lengthdir_y( _r - _w, i),
		_c, _a 
	);
	draw_vertex_color(
		_x + lengthdir_x( _r + _w, i), 
		_y + lengthdir_y( _r + _w, i),
		_c, _a 
	);
}

//Last point
draw_vertex_color(
	_x + lengthdir_x( _r - _w, _end), 
	_y + lengthdir_y( _r - _w, _end),
	_c, _a 
);
draw_vertex_color(
	_x + lengthdir_x( _r + _w, _end), 
	_y + lengthdir_y( _r + _w, _end),
	_c, _a 
);

draw_primitive_end();