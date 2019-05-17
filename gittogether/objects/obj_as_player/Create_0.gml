/// @desc 

speed = 0;
maxSpeed = 4;

canShoot = true;
shootTimer = 20;

timer = shootTimer;

life = 3;

god = false;

if (!audio_is_playing(snd_as_main)) audio_play_sound(snd_as_main, 1000, true);