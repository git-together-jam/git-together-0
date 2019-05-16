/// @description Insert description here
// You can write your code in this editor

with(other)
{
	eld_create_explosion(x, y, 12);
	instance_destroy();
}

instance_destroy();

audio_play_sound(snd_eld_lander_explode, 0, false);

obj_eld_controller.eld_score += (obj_eld_controller.bugs_zapped div 5) * 5 + 5;
obj_eld_controller.bugs_zapped += 1;