///@desc Initialize variables.

x = RES_W/2;
y = RES_H/2;

start = 0;
finish = 0;
flash = 0;

playerScore = 0;
enemyScore = 0;

//Start the music.
music = -1;
if !audio_is_playing(snd_po_music) then music = audio_play_sound(snd_po_music,0,1);

audio_sound_gain(snd_po_music,0,0);
audio_sound_gain(snd_po_music,1,4000);