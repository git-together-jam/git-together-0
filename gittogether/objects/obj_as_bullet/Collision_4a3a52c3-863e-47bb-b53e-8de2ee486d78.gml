/// @desc 

audio_play_sound(snd_as_rock_burst, 100, false);

instance_destroy();

with (other) {
	instance_destroy();
	
	repeat(irandom_range(8, 12)) {
		instance_create_depth(x, y, depth, obj_as_particle);
	}
	
	if (sprite_index == spr_as_rock_large) {
		repeat(2) {
			with(instance_create_depth(x, y, depth, object_index)) {
				sprite_index = spr_as_rock_small;
				speed = 1.1;
			}
		}
	}
}