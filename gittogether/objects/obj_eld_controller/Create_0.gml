/// @description Insert description here
// You can write your code in this editor

#macro ELD_ENEMY_SPACING 17

enum ELDGameState {
	Galaga,
	MissileCommand
};

enum ELDWaveState {
	Spawning,
	Waiting
};

gameState = ELDGameState.Galaga;
waveState = ELDWaveState.Spawning;

eld_init_tracks();

// 0  1  2  3  4  5  6  7  8  9
//10 11 12 13 14 15 16 17 18 19
//20 21 22 23 24 25 26 27 28 29
//30 31 32 33 34 35 36 37 38 39
//40 41 42 43 44 45 46 47 48 49
waves = [
	[
		[  0, "T00", 11, 12, 21, 22, 31, 32, 41, 42 ],
		[  5, "T01", 13, 14, 23, 24, 33, 34, 43, 44 ],
		[ 10, "T00", 15, 16, 25, 26, 35, 36, 45, 46 ],
		[ 15, "T01", 17, 18, 27, 28, 37, 38, 47, 48 ],
		[ 25, "T01",  0,  1,  2,  3,  4 ],
		[ 25, "T00",  5,  6,  7,  8,  9 ]
	]
];

waves_in_progress = ds_list_create();

start_time = current_time * 0.001;
curr_wave = 0;
curr_subwave = 0;

x = room_width div 2 - 5 * ELD_ENEMY_SPACING;
initial_x = x;



origin_x = round(x);

y = ELD_ENEMY_SPACING;

fuelpads_in_wave = 1;

if (!audio_is_playing(snd_eld_music))
	audio_play_sound(snd_eld_music,0,true);
	
enemySprites = [
	spr_eld_enemy_butter,
	spr_eld_enemy_long,
	spr_eld_enemy_sting
];
