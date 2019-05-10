/// @arg x
/// @arg y
/// @arg text
/// @arg xscale
/// @arg yscale
/// @arg angle
/// @arg color
/// @arg alpha

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (argument_count==3){
	draw_text(argument[0], argument[1], argument[2]);
}else if (argument_count==6){
	draw_text_transformed(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
}else{
	draw_text_transformed_color(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[6], argument[6], argument[6], argument[7]);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
