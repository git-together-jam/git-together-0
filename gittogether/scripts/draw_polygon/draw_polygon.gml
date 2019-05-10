/// @func draw_polygon_ext(x,y,points,radius,color)
/// @param x
/// @param y
/// @param points
/// @param radius
/// @param color

draw_set_color(argument4);
draw_primitive_begin(pr_trianglestrip);

for (var _i = 0; _i <= argument2; ++_i) {
	var _dir = 360 / argument2 * _i;
	draw_vertex(argument0 + lengthdir_x(argument3, _dir), argument1 + lengthdir_y(argument3, _dir));
}

draw_primitive_end();
draw_set_color(c_white);