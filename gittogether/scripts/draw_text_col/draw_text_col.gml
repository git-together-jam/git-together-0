/// @func draw_text_col(x, y, string, [color, alpha])
/// @arg x
/// @arg y
/// @arg string
/// @arg [color
/// @arg alpha]

gml_pragma("forceinline");

if (argument_count > 3) {
	draw_text_color(argument[0], argument[1], 
					argument[2], 
					argument[3], argument[3], argument[3], argument[3],
					argument_count > 4 ? argument[4] : 1);
} else {
	draw_text(argument[0], argument[1], argument[2]);
}