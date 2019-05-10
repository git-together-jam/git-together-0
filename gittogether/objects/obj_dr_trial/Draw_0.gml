
var _dial = dialogue[| dialogue_index];
var _char = characters[? _dial[? "name"]];
draw_sprite(_char[? "sprite"], 0, 0, 0);

draw_set_font(text_font);

draw_rect(0, room_height * .79, room_width, room_height, $000000, .5);
draw_text(text_padding, room_height * .8, text);