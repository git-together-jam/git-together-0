//movement
moveTime = 6;
moveTimer = 0;
moveSpeed = 16/6;
xMove = 0;
yMove = 0;
control = true;

//sprite manipulation
xscale = 1;
yscale = 1;

if (!audio_is_playing(snd_frog_theme)) audio_play_sound(snd_frog_theme,100,true);