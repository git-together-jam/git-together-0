
sprites = [
	spr_dr_tonystr,
	spr_dr_matharoo,
	spr_dr_pope,
	spr_dr_sahaun,
	spr_dr_yellowaf
];
sprites_count = array_length_1d(sprites)
sprites_index = 0;

var _buff = buffer_load("dungandrompa_dialogue.txt");
dialogue = buffer_read(_buff, buffer_text);
buffer_delete(_buff);