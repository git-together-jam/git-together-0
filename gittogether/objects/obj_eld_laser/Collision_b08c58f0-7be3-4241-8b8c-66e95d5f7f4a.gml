/// @description Insert description here
// You can write your code in this editor

var _points = 5;
if ( other.state == ELDEnemyState.Tracking ) _points += 10;
else if (other.state == ELDEnemyState.Formation ) _points += 5;

with(other)
{
	eld_create_explosion(x, y, 12);
	instance_destroy();
}

instance_destroy();

audio_play_sound(snd_eld_lander_explode, 0, false);

obj_eld_controller.eld_score += (obj_eld_controller.bugs_zapped div 5) * 5 + _points;
obj_eld_controller.bugs_zapped += 1;