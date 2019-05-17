/// @description 



// Properties
moveSpeed = 3;

// Variables
hsp = 0;
vsp = 0;

arcade = noone; // Arcade in collision

// is the player reading a trash can?
trash_read = false;
trash_message = "";
trash_read_time = 0;
trash_read_time_default = 90;

startedGame = false;

//Animation
arcadeSelectTime = 0;

//x and y position saved by controller
x = global.Overworldx;
y = global.Overworldy;

//music
if (!audio_is_playing(snd_overworld_theme)) audio_play_sound(snd_overworld_theme,100,true);