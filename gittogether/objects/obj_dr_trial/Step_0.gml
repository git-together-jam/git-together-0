
sprites_index = (
	sprites_index + sprites_count +
	keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
) % sprites_count;

sprite_index = sprites[sprites_index];